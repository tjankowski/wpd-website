# -*- encoding : utf-8 -*-
class Category < ActiveRecord::Base
  has_many :product_category, :dependent => :destroy
  has_many :products, :through => :product_category, :order => 'position'
  acts_as_ferret :fields => [:name]

  validates_uniqueness_of :name, :message => 'już istnieje.'
  
  def self.search(search)
    if(search)
      find(:all, :conditions => ['lower(name) LIKE ?', "%#{search.downcase}%"], :order => 'position')
    else
      find(:all)
    end
  end

end
