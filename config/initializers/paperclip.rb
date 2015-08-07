Paperclip.configure do |config|
	config.paperclip_defaults = {
  :storage => :s3,
  :s3_credentials => {
    :bucket => ENV['S3_BUCKET_NAME'],
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    # :region => 'us-east-1',
    # :s3_host_name => 'frie-away-chicken.s3-website-us-east-1.amazonaws.com',
    # :url => ':s3_domain_url'
  }
}
end