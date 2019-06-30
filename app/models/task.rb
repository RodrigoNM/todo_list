class Task < ApplicationRecord
  belongs_to :board
  belongs_to :stage
end
