class CreateBuyItems < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_items do |t|
      t.string :japan_image_url
      t.string :japan_title
      t.string :japan_url
      t.string :item_description
      t.integer :japan_price
      t.string :china_image_url
      t.string :china_title
      t.string :china_url
      t.float :china_price
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
