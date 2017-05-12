class ChangePriceTypeToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :shoes, :price, :decimal
  end
end
