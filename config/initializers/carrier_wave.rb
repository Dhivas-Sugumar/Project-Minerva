require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|

  if Rails.env.development?  || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end

  config.fog_provider = 'fog/google'
  config.fog_credentials = {
    provider: 'Google',
    google_storage_access_key_id: ENV["GOOGLE_STORAGE_ACCESS_KEY_ID"],
    google_storage_secret_access_key: ENV["GOOGLE_STORAGE_SECRET_ACCESS_KEY"],

  }

  config.fog_directory = ENV["GOOGLE_STORAGE_BUCKET_NAME"]
end