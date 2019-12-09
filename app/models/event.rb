class Event < ApplicationRecord
    #validates :description,  presence: true, length: { maximum: 50 }    
    #description with minimun and maximum size
    #validate that date makes sense and is not just a string

    belongs_to :creator, class_name: "User"
end
