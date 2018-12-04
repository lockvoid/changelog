class Release < ApplicationRecord
  BODY_TEMPLATE =
<<-EOS
### Features 💥

- Version navigation.

### Bugfixes 🔥

- Fix typos in the recent template.
EOS

  belongs_to :project

  validates :name, presence: true
end
