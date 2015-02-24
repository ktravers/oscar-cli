class Nominee < ActiveRecord::Base
  belongs_to :category
  attr_accessor :vote

  def initialize(name, attribute, vote="")
    self.vote = vote
    self.name = name
    self.attribute = attribute
  end

end