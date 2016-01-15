class Recipe < ActiveRecord::Base
  belongs_to :chef
  validates :chef_id, presence: true
  validates :name, presence: true
  #validates :summary, length: { minimum: 20}
  #validates :description, length: { in: 20..500}
end
