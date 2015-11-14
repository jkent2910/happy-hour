class Address < ActiveRecord::Base 
  belongs_to :addressable, :polymorphic => true

  validates :line1, :city, :state, :zip, presence: true 

  VALID_CITIES = ['Cedar Rapids', 'Clive', 'Des Moines', 'Iowa City', 'Marion', 'Norwalk', 'Urbandale', 'West Des Moines']

end