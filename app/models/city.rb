class City < ActiveRecord::Base
  validates :destination, presence: true
  validates :state, presence: true

end
