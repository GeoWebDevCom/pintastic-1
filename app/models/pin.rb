class Pin < ApplicationRecord
  belongs_to :board

  validates :title, :summary, :image, presence: true
  has_attached_file :image, styles: { wide_1440: "1440x460#", thumb: "200x200>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
