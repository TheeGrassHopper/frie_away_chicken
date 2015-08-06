class Recipe < ActiveRecord::Base
	ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'
	belongs_to :user
  	has_many :ingredients
  	has_many :directions
  	accepts_nested_attributes_for :ingredients,
  		reject_if: proc { |attributes| attributes['name'].blank? },
  			allow_destroy: true
 	accepts_nested_attributes_for :directions,
 		reject_if: proc { |attributes| attributes['step'].blank? },
  			allow_destroy: true
 	validates :title, :description, :image, presence: true
	has_attached_file :image, styles: { :medium => "400x400#", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",:image,
                    :storage => :s3,
                    :s3_credentials => {
    :bucket => ENV['S3_BUCKET_NAME'],
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
    :region => 'us-east-1',
    :s3_host_name => 'frie-away-chicken.s3-website-us-east-1.amazonaws.com',
    :url => ':s3_domain_url'
  }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  d
end