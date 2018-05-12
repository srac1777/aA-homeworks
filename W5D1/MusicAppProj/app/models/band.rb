class Band < ApplicationRecord
  validates_presence_of :name

  has_many :albums,
  foreign_key: :band_id,
  class_name: :Band
end
