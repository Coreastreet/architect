class Creator < ApplicationRecord
  has_secure_password

  has_many :subjects
end
