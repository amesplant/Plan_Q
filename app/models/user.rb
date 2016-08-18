require 'bcrypt'

class User < ActiveRecord::Base
  has_many :lessons, through: :plans
  has_many :plans

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :hashed_password, presence: true
  validate :password_complexity


  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(form_password)
    @user_entered_password = form_password
    @password = BCrypt::Password.create(form_password)
    self.hashed_password = @password
  end

  def authenticate(password)
    self.password == password
  end

  def password_complexity
    if @user_entered_password && @user_entered_password.length < 6
      self.errors.add(:password, "should be at least 6 characters")
    end
  end

end
