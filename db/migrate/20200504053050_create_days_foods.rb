class CreateDaysFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :days_foods do |t|
      t.integer :day_id
      t.integer :food_id
    end
  end
end
