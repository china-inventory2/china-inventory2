require 'rails_helper'

RSpec.describe User, type: :model do
  # 名前がなかったら無効であること
  it "is valid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  # メールアドレスがない場合は無効であること
  it "is valid without a email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  # メールアドレスが重複している場合は無効であること
  it "is invalid with a duplicate email " do
    FactoryBot.create(:user, email: "tester@exaple.com")
    user = FactoryBot.build(:user, email: "tester@exaple.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  # アドレスがない場合は無効であること
  it "is valid without a adress" do
    user = FactoryBot.build(:user, address: nil)
    user.valid?
    expect(user.errors[:address]).to include("can't be blank")
  end
end
