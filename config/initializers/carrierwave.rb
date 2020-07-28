require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.development?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_ACCESS_KEY_ID"],
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'exercisediary2020'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/exercisediary2020'
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end