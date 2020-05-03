class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.date :date
      t.integer :calories
      t.integer :protein
      t.integer :carbs
      t.integer :fat
      t.integer :user_id
    end
  end
end
