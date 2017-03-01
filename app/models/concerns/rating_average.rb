module RatingAverage
  extend ActiveSupport::Concern

  def average_rating
    koko = ratings.count.to_f
    if (koko==0)
      return 0.0
    else
      (ratings.map(&:score).inject(&:+)/koko).round(2)
    end
  end
end