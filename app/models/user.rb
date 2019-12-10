class User < ApplicationRecord
    before_save :downcase_email

    validates :name,  presence: true, length: { maximum: 50 }       
    VALID_EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
    validates :email, presence: true, length: { maximum: 255 }, 
         format: { with: VALID_EMAIL_REGEX },
         uniqueness: { case_sensitive: false }

    has_many :events, foreign_key: :creator_id, class_name: "Event"
    has_many :attendances, foreign_key: :attendee_id
    has_many :attended_events, through: :attendances

    private
    # Converts email to all lower-case.
    def downcase_email
      self.email.downcase!
    end 
end
