class ChangePriceInSpecials < ActiveRecord::Migration
  def change
    change_column :specials, :price, :decimal
  end
end
