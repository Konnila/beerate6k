class Rating < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user

  validates :score, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 50,
                                    only_integer: true }

  scope :recent, -> { order "created_at DESC" and limit(5)}

  def asd
    sorted_by_rating_in_desc_order = Rating.all.sort_by{ |b| b.user}
  end

  def to_s
    "#{beer.name} #{score}"
  end
end
