class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.string :day_of_the_week
      t.integer :business_id
      t.belongs_to :business, index:true

      t.timestamps null: false
    end
  end
end
