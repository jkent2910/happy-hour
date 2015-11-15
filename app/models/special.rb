class Special < ActiveRecord::Base

  belongs_to :business 
  validates :name, :category, :price, :day_of_the_week, presence: true

  serialize :day_of_the_week, Array

  VALID_DAYS_OF_THE_WEEK = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']

  VALID_CATEGORIES = ['Food', 'Drinks - Beer', 'Drinks - Liquor']

end
