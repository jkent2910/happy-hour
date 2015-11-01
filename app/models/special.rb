class Special < ActiveRecord::Base

  belongs_to :business 
  validates :name, :category, :price, :day_of_the_week, presence: true

end
