class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :collaborations
  has_many :projects, through: :collaborations

  validates :email, uniqueness: true, presence: true, email: true
  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :display_name, presence: true
end
