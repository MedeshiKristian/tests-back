class Course < ApplicationRecord
  has_many :tests, dependent: :destroy
end
