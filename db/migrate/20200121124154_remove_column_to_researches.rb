class RemoveColumnToResearches < ActiveRecord::Migration[5.2]
  def change
    remove_column :researches, :simulate_price, :integer
  end
end
