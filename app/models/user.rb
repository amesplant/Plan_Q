require 'bcrypt'

class User < ActiveRecord::Base
  has_many :lessons, through: :plans
  has_many :plans

  validates :first_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validate :password_complexity
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validate :password_match


  def password
    # encrypt the password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(form_password)
    @user_entered_password = form_password #used to test password complexity before it is encrypted
    @password = BCrypt::Password.create(form_password)
    self.encrypted_password = @password
  end

  def authenticate(password)
    self.password == password
  end

  def password_complexity
    if @user_entered_password && @user_entered_password.length < 6
      self.errors.add(:password, "should be at least 6 characters")
    end
  end

  def password_match
    if @user_entered_password != @user_enetered_password_confirmation
      self.errors.add(:password, "passwords don't match")
    end
  end

end
