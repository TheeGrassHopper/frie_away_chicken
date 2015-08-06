# config/initializers/paperclip.rb
Paperclip::Attachment.default_options.merge!(
:storage => :s3,
  :s3_credentials => {
    :bucket => ENV['S3_BUCKET_NAME'],
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
    :region => 'us-west-2',
    :s3_host_name => 's3-us-west-2.amazonaws.com',
    :url => ':s3_domain_url'
  }
)
