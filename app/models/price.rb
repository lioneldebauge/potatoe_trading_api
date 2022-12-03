class Price < ApplicationRecord
  validates_presence_of :time, :value
end
