class User < ApplicationRecord
  has_secure_token

  has_many :projects, dependent: :destroy

  def searcher?
    purpose
  end

  def introducer?
    !purpose
  end
end
