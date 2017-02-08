class Tweet < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true,
                      length: {
                        in: 1..140,
                        too_long: "Your tweet is too long!",
                        too_short: "Empty tweets are not allowed"
                      }

  before_validation :remove_trailing_whitespace

  private
  def remove_trailing_whitespace
    self.content.strip!
  end
end
