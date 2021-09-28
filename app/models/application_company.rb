class ApplicationCompany < ApplicationRecord
  belongs_to :user
  belongs_to :project

  def to_hash
    {
      "id": id,
      "name": name,
      "detail": detail,
      "reason": reason,
      "contact_name": contact_name,
      "contact_email": contact_email,
      "phone_number": phone_number,
      "status_worker": status_worker,
      "status_project": status_project,
      "created_at": created_at,
      "updated_at": updated_at,
      "project": project,
      "author": user
    }
  end
end
