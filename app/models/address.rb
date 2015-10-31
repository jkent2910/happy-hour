class Address < ActiveRecord::Base 
  belongs_to :addressable, :polymorphic => true

  validates :line1, :city, :state, :zip, presence: true 
end