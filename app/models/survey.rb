class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :choices, through: :questions
  has_many :selections, through: :choices
end
