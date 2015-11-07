class Business < ActiveRecord::Base
  has_one :address, :as => :addressable
  accepts_nested_attributes_for :address

  has_many :specials
  accepts_nested_attributes_for :specials, reject_if: :all_blank, allow_destroy: true 

  validates :name, :start_time, :end_time, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
