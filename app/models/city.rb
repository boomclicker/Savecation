class City < ApplicationRecord
  has_many :tripplaces, dependent: :destroy
  validates_presence_of :name


end
