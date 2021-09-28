class Project < ApplicationRecord
  belongs_to :user, optional: true
  has_many :application_companies

  def to_hash
    {
      id: id,
      name: name,
      status: status,
      concept: concept,
      deadline: deadline,
      wish_person: wish_person,
      appeal: appeal,
      reward: reward,
      company_info: company_info,
      company_url: company_url,
      created_at: created_at,
      updated_at: updated_at,
      category: category,
      company_name: user.name
    }
  end
end
