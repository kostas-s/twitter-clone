class Tweet < ApplicationRecord
    belongs_to :user
    validates :tweet, presence: true, length: { minimum: 5, maximum: 160 }
end
