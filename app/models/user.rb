require 'bcrypt'

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validate :password_complexity

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
    self.password = password
  end

  def password_complexity
    if @user_entered_password && @user_entered_password.length < 6
      self.errors.add(:password, "password need to have at least 6 characters")
    end
  end
end
