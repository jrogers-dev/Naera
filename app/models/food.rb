class Food < ActiveRecord::Base
  belongs_to :user
  belongs_to :day

  validates :name, presence: true
  validates :calories, presence: true
end
  