class Day < ActiveRecord::Base
  belongs_to :user
  has_many :foods

  validates :date, presence: true


  def update_stats
    stats_hash = {
      calories: 0,
      protein: 0,
      carbs: 0,
      fat: 0
    }

    self.foods.each do |f|
      stats_hash[:calories] += f.calories
      stats_hash[:protein] += f.protein
      stats_hash[:carbs] += f.carbs
      stats_hash[:fat] += f.fat
    end

    self.update(stats_hash)
  end
end
