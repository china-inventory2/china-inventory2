require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  
  config.fog_provider = 'fog/aws'
  # storage, cache_storageはfog(外部サービス指定)
  config.storage :fog
  config.cache_storage = :fog
  # ブラウザから参照する際のパスを指定(http://ドメイン/バケット名)
  config.asset_host = 'http://localhost:9000/china-inventory-carrierwave'
  # バケット名
  config.fog_directory  = 'china-inventory-carrierwave'
  # 認証情報
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['MINIO_ACCESS_KEY'],
    aws_secret_access_key: ENV['MINIO_SECRET_KEY'],
    path_style: true,
    region: 'ap-northeast-1',
    host: 'minio',
    endpoint: 'http://minio:9000'
  }
end
# ファイル名に日本語を許可
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
