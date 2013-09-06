class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices
  has_many :selections, through: :choices
end
