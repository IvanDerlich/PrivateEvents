# frozen_string_literal: true

class Event < ApplicationRecord
  validates :description, presence: true, length: { maximum: 150 }
  validates :date, presence: true
  validates :creator, presence: true
  # description with minimun and maximum size
  # validate that date makes sense and is not just a string

  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :attendee

  scope :upcoming_events, -> { where('date >= ?', Time.now) }
  scope :previous_events, -> { where('date < ?', Time.now) }
end
