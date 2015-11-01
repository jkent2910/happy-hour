class Business < ActiveRecord::Base
  has_one :address, :as => :addressable
  accepts_nested_attributes_for :address

  has_many :specials
  accepts_nested_attributes_for :specials, reject_if: :all_blank, allow_destroy: true 

  validates :name, :start_time, :end_time, presence: true
  validates :name, uniqueness: true 
end
