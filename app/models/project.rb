class Project < ApplicationRecord
  before_create :renew_api_key

  has_many :collaborations
  has_many :users, through: :collaborations
  has_many :releases

  validates :name, presence: true

  def renew_api_key
    self.api_key = SecureRandom.hex(8)
  end
end
