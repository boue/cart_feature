class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates_presence_of :name, :price
  # validates price is a number
  validates_numericality_of :price
end
