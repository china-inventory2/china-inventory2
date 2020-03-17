class Image < ApplicationRecord
  mount_uploader :name, AvatarUploader
  validates :name, presence: true
end
