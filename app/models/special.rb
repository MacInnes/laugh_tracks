class Special < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :comedian
end
