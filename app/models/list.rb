class List < ApplicationRecord
  belongs_to :board
  has_many :cards, dependent: :destroy

  validates :name, presence: true
end
