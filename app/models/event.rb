class Event < ApplicationRecord
  VIEW = 'VIEW'
  THUMBS_UP = 'THUMBS_UP'
  THUMBS_DOWN = 'THUMBS_DOWN'

  belongs_to :notice

  validates :type, inclusion: { in: [VIEW, THUMBS_UP, THUMBS_DOWN] }
end
