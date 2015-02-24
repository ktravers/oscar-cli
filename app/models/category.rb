class Category < ActiveRecord::Base
  has_many :nominees
  attr_accessor :winner

  def initialize(name, winner="?")
    self.name = name
    self.winner = winner
  end

end