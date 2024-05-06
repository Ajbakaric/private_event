# app/models/event.rb
class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user
  has_many :invitations
  has_many :invitees, through: :invitations, source: :invitee

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }
end
