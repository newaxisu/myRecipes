class Recipe < ActiveRecord::Base
  belongs_to :chef
  validates :chef_id, presence: true
  validates :name, presence: true
  validates :summary, presence: true
  mount_uploader :picture, PictureUploader
  validate :picture_size
  #validates :summary, length: { minimum: 20}
  #validates :description, length: { in: 20..500}
  
  private
    def picture_size
      if picture.size >5.megabytes
        errors.add(:picture, "should be less than 5 MB")
      end
    end
end

