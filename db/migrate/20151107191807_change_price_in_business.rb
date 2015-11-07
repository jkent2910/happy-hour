class ChangePriceInBusiness < ActiveRecord::Migration
  def change
    change_column :specials, :price, :float
  end
end
