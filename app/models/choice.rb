class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :selections
  validates :option, presence:true
end
