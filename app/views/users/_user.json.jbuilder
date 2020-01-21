json.extract! user, :id, :name, :employee_number, :line_id, :email, :address, :phone_number, :account_bank_name, :account_number, :business_expenses, :password_digest, :inventory_manager_flg, :reserch_user_flg, :owner_flg, :fired_flg, :admin, :remember_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
