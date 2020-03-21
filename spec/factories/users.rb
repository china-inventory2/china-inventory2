FactoryBot.define do
  factory :user do
    name { "aron" }
    line_id { 1234 }
    sequence(:email) { |n| "tester#{n}@exaple.com" }
    address { "nagoyashi-aichi" }
    account_bank_name { "mitubisi,UFJ_bank" }
    account_number { "12451" }
    business_expenses { "aaaaa" }
    password { "password" }
    phone_number { "000000000" }
    inventory_manager_flg { true }

    trait :invalid do
      name { nil }
    end
  end
  factory :second_user, class: User do
    name { "mary" }
    line_id { 2345 }
    sequence(:email) { |n| "enginer#{n}@exaple.com" }
    address { "shibuya-tokyo" }
    account_bank_name { "mizuho_bank" }
    account_number { "19259" }
    business_expenses { "mioad" }
    password { "password" }
    phone_number { "111111111" }
    reserch_user_flg { true }
  end
  factory :takashi, class: User do
    name { "Takashi" }
    line_id { 2345 }
    email { "takashi@example.com" }
    address { "shibuya-tokyo" }
    account_bank_name { "mizuho_bank" }
    account_number { "19259" }
    business_expenses { "mioad" }
    password { "password" }
    phone_number { "111111111" }
    reserch_user_flg { true }
  end

  factory :satoshi, class: User do
    name { "Satoshi" }
    line_id { 2345 }
    email { "takashi@example.com" }
    address { "shibuya-tokyo" }
    account_bank_name { "mizuho_bank" }
    account_number { "19259" }
    business_expenses { "mioad" }
    password { "password" }
    phone_number { "111111111" }
    reserch_user_flg { true }
  end
end
