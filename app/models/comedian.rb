class Comedian < ActiveRecord::Base
  validates :name, presence: true
  validates :age, presence: true
  has_many :specials
end
