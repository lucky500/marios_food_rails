class Review < ActiveRecord::Base
  belongs_to :product
  validates :author, :content_body, :rating, :presence => true
end