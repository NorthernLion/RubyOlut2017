class BeerClub < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user

  def member(user)
    members.include? user
  end
end