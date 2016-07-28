class Lesson < ActiveRecord::Base
  has_many :users, through: :plans
  has_many :plans

  validates :title, presence: true

end
