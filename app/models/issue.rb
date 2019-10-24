class Issue < ApplicationRecord
  has_many :comments

  scope :unresolved, -> { where(open_status: true) }
  scope :resolved, -> { where(open_status: false).order(resolved_date: :desc) }

end
