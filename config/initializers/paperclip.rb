# config/initializers/paperclip.rb
Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:s3_host_name] = 'frie-away-chicken.s3-website-us-east-1.amazonaws.com'
Paperclip::Attachment.default_options[:default_url] = '/images/default_image.png'