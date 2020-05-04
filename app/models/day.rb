class Day < ActiveRecord::Base
  belongs_to :user
  has_many :foods, through: :days_foods
end
