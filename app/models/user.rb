class User < ActiveRecord::Base
  # Relations
  has_many :questions
  has_many :votes
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
 
  # Facebook Autentification for user, this function set fields to save on database via social login check gem 'omniauth-facebook'
  def self.from_omniauth(auth)
  	user = User.find_by(email: auth.info.email)
  	if user
  		user.provider = auth.provider
  		user.uid = auth.uid
  		return user
  	end
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  		user.uid = auth.uid
  		user.name = auth.info.name
  		user.email = auth.info.email
  		user.password = Devise.friendly_token[0,20]
      # Get image
      url = URI.parse("http://graph.facebook.com/#{auth.uid}/picture?type=large")
      res = Net::HTTP.get_response(url)
      user.image = res['location']
      # ---
      user.save
    end
  end

  def update_with_password(params={}) 
  	if params[:password].blank? 
  		params.delete(:password) 
  		params.delete(:password_confirmation) if params[:password_confirmation].blank? 
  	end 
  	update_attributes(params) 
  end
  # --

  # PaperClip
  has_attached_file :image, :styles => {
    :large => "512x512",
    :medium => "200x200",
    :small => "168x168",
    :thumb => "40x40",
    :tiny => "32x32"
  },
  :url  => "/images/users/:id-:basename.:style.:extension",
  :path => ":rails_root/public/images/users/:id-:basename.:style.:extension",
  :default_url => :set_default_url

  # Paperclip validations
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :less_than => 10.megabytes

  # if user dont have image
  def set_default_url
  	"/img/missing.png"
  end
  # End ---

end