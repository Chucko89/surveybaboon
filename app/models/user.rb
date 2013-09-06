class User < ActiveRecord::Base
  has_many :surveys
  has_many :selections
  has_many :questions, through: :surveys
  has_many :choices, through: :questions

 include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email,password)
    @user = User.find_by_email(email)
    
    return nil unless @user
    @user.password == password ? @user.id : nil
  end
end

