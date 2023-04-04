class AddAttrToKitten < ActiveRecord::Migration[7.0]
  def change
    change_table :kittens do |t|
      t.string :name
      t.integer :age
      t.integer :cuteness
      t.integer :softness
    end
  end
end
