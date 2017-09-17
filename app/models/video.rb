class Video < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :file
  validates :name, presence: true, uniqueness: true
  validates_attachment_content_type :file, :content_type => ["video/mp4"]
end
