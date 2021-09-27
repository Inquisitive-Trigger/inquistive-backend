class User < ApplicationRecord
  has_secure_token

  def searcher?
    type
  end
end
