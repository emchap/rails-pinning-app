class Pin < ActiveRecord::Base
  validates_presence_of :title, :url, :slug, :text, :category_id
  validates_uniqueness_of :slug
  has_attached_file :image, styles: { medium: "300x300>", thumb: "60x60>" }, default_url: "https://placebear.com/60/60"  
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  belongs_to :category
end