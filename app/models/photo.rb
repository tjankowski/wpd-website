# -*- encoding : utf-8 -*-
class Photo < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image, :styles => { :small => "150x150>" },
    :url => "/products/:id/:style/:basename.:extension",
    :path => ":rails_root/public/products/:id/:style/:basename.:extension"
  attr_accessor :should_destroy

  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/jpg', 'image/png']

  def should_destroy?
    should_destroy.to_i == 1
  end

  def title
    if self.description.blank?
      self.product.name+self.id.to_s
    else
      self.description
    end
  end
  
end
