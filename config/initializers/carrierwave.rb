 
  CarrierWave.configure do |config|

    # config.storage = :fog
    # config.fog_use_ssl_for_aws = true
    # config.fog_directory  = ENV['S3_BUCKET']
    # config.fog_public     = true
    # config.fog_attributes = { 'Cache-Control': 'max-age=315576000' }
    # config.asset_host = 'https://s3.amazonaws.com/mygalleryapp'

  	config.fog_provider = 'fog/aws'  
  
    config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY']
    }

    config.fog_directory = ENV['S3_BUCKET']
 # config.asset_host = 'https://s3.amazonaws.com/mygalleryapp'
  end
