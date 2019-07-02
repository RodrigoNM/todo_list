class Task < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :board_id, presence: true
  validates :stage_id, presence: true

  belongs_to :board
  belongs_to :stage
end
