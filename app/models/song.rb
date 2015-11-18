class Song < ActiveRecord::Base
  belongs_to :party
  validates_presence_of :url
end
