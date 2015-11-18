class Party < ActiveRecord::Base
  has_many :songs
  validates :name, uniqueness: true
  validates_presence_of :name
end
