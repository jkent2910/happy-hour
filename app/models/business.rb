class Business < ActiveRecord::Base
  has_one :address, :as => :addressable
  accepts_nested_attributes_for :address

  validates :name, :start_time, :end_time, presence: true
  validates :name, uniqueness: true 
end
