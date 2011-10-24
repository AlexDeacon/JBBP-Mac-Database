class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # confirmable, :token_authenticatable, :encryptable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  # User Accessable Fields
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  
  # See https://github.com/plataformatec/devise/wiki/How-To:-Require-admin-to-activate-account-before-sign_in
  #
  def active_for_authentication? 
    super && approved? 
  end 
  
  def inactive_message 
    if !approved?
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
  
end
