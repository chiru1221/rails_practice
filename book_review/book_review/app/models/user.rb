class User < ApplicationRecord
  has_secure_password
  has_many :reviews

  validates :role, inclusion: {in: ['admin', 'reviewer']}
  validates :userid, presence: true
  validates :name, presence: true
  validates :role, presence: true
  validates :email, presence: true
  validates :password, presence: true


  def admin?
    role == 'admin'
  end

  def reviewer?
    role == 'reviewer'
  end
end
