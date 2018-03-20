class Recipe < ActiveRecord::Base
    belongs_to :user
    
    has_many :ingredients
    has_many :directions
    accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? } , allow_destroy: true
    accepts_nested_attributes_for :directions, reject_if: proc { |attributes| attributes['steps'].blank? } , allow_destroy: true
    
    validates :title, :description, :image, presence: true
    
    has_attached_file :image, styles: { :medium => "300x300#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
