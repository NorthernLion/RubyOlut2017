class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer_club

  validates :user, uniqueness: {scope: :beer_club}

  def member?(user, beer_club)
    Membership.find_by(beer_club.id, user.id)
  end
end

