class AddShoesAndStoresTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
    end
    create_table(:shoes) do |t|
      t.column(:brand, :string)
      t.column(:price, :integer)
    end
  end
end
