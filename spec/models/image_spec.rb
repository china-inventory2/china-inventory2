require 'rails_helper'

RSpec.describe Image, type: :model do
  # 画像名がなければ無効な状態であること
  it "is invalid without a name" do
    image = Image.new(name: nil)
    image.valid?
    expect(image.errors[:name]).to include("can't be blank")
  end
end
