class Diary < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader
  def self.search(search)
    if search
      Diary.where('text LIKE(?)', "%#{search}%")
    else
      Diary.all
    end
  end
end
