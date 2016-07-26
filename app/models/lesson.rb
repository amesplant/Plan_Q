class Lesson < ActiveRecord::Base
  has_many :users, through: :plans

  validates :title, presence: true

end
