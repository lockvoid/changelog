class Notice < ApplicationRecord
  BODY_TEMPLATE =
<<-EOS
We've just lent **a new cool feature**. Check it out! 💥
EOS

  belongs_to :release

  validates :body, presence: true
  validates :trigger_element_css_selector, presence: true
end
