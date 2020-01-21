json.extract! item, :id, :item_number, :item_title, :item_picture, :china_item_picture, :part_number, :jan_code, :simulate_price, :yahoo, :amazon, :mercari, :rakuma, :rakuten, :yahooshopping, :buy_china_item_title, :buy_china_item_url, :sell_japan_url, :researcher_id, :team_id, :created_at, :updated_at
json.url item_url(item, format: :json)
