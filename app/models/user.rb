class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :categories
  has_many :events
  has_many :groups
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :image_url, :nickname, :provider, :url, :username

  def self.find_for_facebook_oauth access_token
    if user = User.where(:url => access_token.info.urls.Facebook).first
      user
    else
      User.create!(:provider => access_token.provider,
        :url => access_token.info.urls.Facebook,
        :username => access_token.extra.raw_info.name,
        :nickname => access_token.extra.raw_info.username,
        :image_url => access_token.info.image,
        :email => access_token.extra.raw_info.email,
        :password => Devise.friendly_token[0,20])
    end
  end

  def self.find_for_vkontakte_oauth access_token
    if user = User.where(:url => access_token.info.urls.Vkontakte).first
      user
    else
      User.create!(:provider => access_token.provider,
        :url => access_token.info.urls.Vkontakte,
        :username => access_token.info.name,
        :nickname => access_token.extra.raw_info.domain,
        :image_url => access_token.extra.raw_info.photo,
        :email => access_token.extra.raw_info.screen_name+'@vk.com',
        :password => Devise.friendly_token[0,20])
    end
  end

end
