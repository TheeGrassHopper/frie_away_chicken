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
	
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  # has_attached_file :image, styles: { :medium => "400x400#", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :image, styles: { :medium => "400x400#", :thumb => "100x100>" },
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  def s3_credentials
    {:bucket => ENV['S3_BUCKET_NAME'],
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  end
end