class Chef < ActiveRecord::Base
  has_many :recipes
  validates :name, presence: true
  validates :email, presence: true #,
                    #uniqueness: {case_sensitive: false}
end
