class User < ApplicationRecord
  enum role: [:standard, :admin, :super_admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true,
                    uniqueness: true,
                    format: { with: /\A[a-z]+\z/i, message: "Letters only" }

  validates :email, presence: true,
                    format: { with: /(\w+.?\w+)@hlcn.mx\z/i, message: "Helicon only" }

end
