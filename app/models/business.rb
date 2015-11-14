class Business < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_one :address, :as => :addressable
  accepts_nested_attributes_for :address

  has_many :specials
  accepts_nested_attributes_for :specials, reject_if: :all_blank, allow_destroy: true 

  validates :name, :start_time, :end_time, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def self.by_category_and_city(city = nil, category = nil)
    return Business.joins(:address).where(addresses: {city: city}) && Business.joins(specials).where(specials: {category: category}).distinct if category && city  
    return Business.joins(:specials).where(specials: {category: category}).distinct if category   
    return Business.joins(:address).where(addresses: {city: city}) if city 
    all 
  end


  def check_time
    start_time_hour = start_time.hour
    end_time_hour = end_time.hour 
    t = Time.now.hour 
    if t >= start_time_hour && t <= end_time_hour 
      return true 
    else
      return false
    end
  end

end
