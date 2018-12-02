class Project < ApplicationRecord
  before_create :renew_api_key

  belongs_to :user
  has_many :releases

  validates :name, presence: true

  def renew_api_key
    self.api_key = SecureRandom.hex(32)
  end
end
