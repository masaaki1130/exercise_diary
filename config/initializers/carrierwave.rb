require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.development? 
    config.storage :file
  elsif Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_public = false 
    config.fog_credentials = {
      provider: 'AWS',
      AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
      AWS_SECRET_ACCESS_KEY: ENV["AWS_ACCESS_KEY_ID"],
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'exercisediary2020'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/exercisediary2020'
  end
end