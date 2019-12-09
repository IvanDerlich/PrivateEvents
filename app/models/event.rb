class Event < ApplicationRecord
    validates :description,  presence: true, length: { maximum: 150 } 
    validates :date, presence: true
    validates :creator, presence: true   
    #description with minimun and maximum size
    #validate that date makes sense and is not just a string

    belongs_to :creator, class_name: "User"
end
