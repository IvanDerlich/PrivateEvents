class User < ApplicationRecord
    #before_save :downcase_email

    #validates :name,  presence: true, length: { maximum: 50 }    
    #name with minimun and maximum size   

    #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # validates :email, presence: true, length: { maximum: 255 }, 
    #     format: { with: VALID_EMAIL_REGEX },
    #     uniqueness: { case_sensitive: false }

    has_many :events
end
