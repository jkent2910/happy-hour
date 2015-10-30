class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :website

      t.timestamps null: false
    end
  end
end
