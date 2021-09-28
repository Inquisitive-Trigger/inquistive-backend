class Project < ApplicationRecord
  belongs_to :user, optional: true

  def to_hash
    {
      id: id,
      name: name,
      status: status,
      concept: concept,
      deadline: deadline,
      reward: reward,
      created_at: created_at,
      updated_at: updated_at,
      category: category,
      company_name: user.name
    }
  end
end
