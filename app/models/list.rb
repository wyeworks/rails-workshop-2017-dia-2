class List < ApplicationRecord
  belongs_to :board

  validates :name, presence: true
end
