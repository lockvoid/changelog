class Notice < ApplicationRecord
  BODY_TEMPLATE =
    <<-EOS
    We've just lent **a new cool feature**. Check it out! 💥
    EOS

  belongs_to :release
  has_many :events

  validates :body, presence: true
  validates :target_element_selector, presence: true

  def views_count
    events.where(name: Event::VIEW).count
  end
end
