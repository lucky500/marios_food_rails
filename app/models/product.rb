class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :cost, :country_of_origin, :presence => true

  scope :made_in_us, -> { where(country_of_origin: 'USA')}
  scope :most_recent,   -> { order(created_at: :desc).limit(3)}
  scope :most_reviewed,    -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
      .joins(:reviews)
      .group("products.id")
      .order("reviews_count DESC")
      .limit(1)
  )}
end