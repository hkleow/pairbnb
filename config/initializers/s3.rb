CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['S3_KEY'],
      :aws_secret_access_key  => ENV['S3_SECRET_KEY'],
      :region                 => ENV['S3_BUCKET_REGION']
       # Change this for different AWS region. Default is 'us-east-1'
  }
  # config.fog_public = true
  config.fog_directory  = ENV['S3_BUCKET_NAME'] #name_of_directory
  # config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }  
end
