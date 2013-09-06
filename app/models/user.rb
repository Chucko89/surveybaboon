class User < ActiveRecord::Base
  has_many :surveys
  has_many :selections
  has_many :questions, through: :surveys
  has_many :choices, through: :questions

end
