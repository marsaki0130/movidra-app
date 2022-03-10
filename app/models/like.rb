class Like < ApplicationRecord
    belongs_to :movie
    belongs_to :drama
    belongs_to :user
end
