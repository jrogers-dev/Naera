class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.integer :protein
      t.integer :carbs
      t.integer :fat
      t.integer :user_id
    end
  end
end
