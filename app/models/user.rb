class User < ApplicationRecord
  has_secure_token

  has_many :projects, dependent: :destroy
  has_many :application_companies, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  validates :email, uniqueness: true

  def searcher?
    !purpose
  end

  def introducer?
    purpose
  end

  def follow(user)
    rel = Relationship.new
    rel.following_id = id
    rel.follower_id = user.id
    rel.save!
  end

  def unfollow(user)
    rel = Relationship.where(following_id: self.id, follower_id: user.id).first
    rel.destroy!
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
