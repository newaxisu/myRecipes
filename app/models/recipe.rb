class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :reviews
  has_many :likes
  validates :chef_id, presence: true
  validates :name, presence: true
  validates :summary, presence: true
  mount_uploader :picture, PictureUploader
  validate :picture_size
  default_scope -> { order(updated_at: :desc) }
  #validates :summary, length: { minimum: 20}
  #validates :description, length: { in: 20..500}
    #has_many :chefs, through: :likes
  
  private
    def picture_size
      if picture.size >5.megabytes
        errors.add(:picture, "should be less than 5 MB")
      end
    end
end

