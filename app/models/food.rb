class Food < ActiveRecord::Base
  belongs_to :user
  has_many :day_foods
  has_many :days, through: :day_foods
end
  