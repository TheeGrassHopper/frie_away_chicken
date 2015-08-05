class User < ActiveRecord::Base
	has_many :recipes
	ratyrate_rater
	attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_attached_file :image, 
  :styles => { :medium => "400x" , :thumb => "100x100" }, 
  :default_url => "default.png",
  :storage => :s3,
  :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

	def s3_credentials
 		 {:bucket => ENV["S3_BUCKET_NAME"], :access_key_id => ENV["AWS_ACCESS_KEY_ID"], 
 		 :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]
	end
end
