class User < ApplicationRecord
  has_many :results, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  enum role: %i[user, admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end
end
