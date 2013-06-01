# -*- encoding : utf-8 -*-
class Product < ActiveRecord::Base
  has_many :product_category, :dependent => :destroy
  has_many :categories, :through => :product_category
  has_many :photos, :order => 'position'
  after_update :save_photos
  acts_as_ferret :fields => [:name, :description, :description_short]

  def main_photo_url_small
    if photos.empty?
      ' '
    else
      photos.first.image.url(:small)
    end
  end

  def main_photo_url
    if photos.empty?
      ' '
    else
      photos.first.image.url
    end
  end

  def has_photo?
    return !photos.empty?
  end

  def belongs_to_category?(category)
    self.categories.find_by_name(category.name) ? true : false
  end

  def categories_attributes=(categories_attributes)
    categories_attributes.each do |attributes|
      category = Category.find_or_create_by_name(attributes[:name])
      product_category.build(:category => category, :product => self)
    end
  end

  def photos_attributes=(photos_attributes)
    photos_attributes.each do |attributes|
      if attributes[:id].blank?
        photos.build(attributes)
      else
        photo = photos.detect { |p| p.id == attributes[:id].to_i }
        photo.attributes = attributes
      end
    end
  end
  
  def save_photos
    photos.each do |p|
      if p.should_destroy?
        p.destroy
      else
        p.save(false)
      end
    end
  end

end
