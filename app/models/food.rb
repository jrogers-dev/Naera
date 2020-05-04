class Day < ActiveRecord::Base
  belongs_to :user
  has_many :days, through: :days_foods
end
  