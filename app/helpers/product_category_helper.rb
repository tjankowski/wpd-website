# -*- encoding : utf-8 -*-
module ProductCategoryHelper

  def remove_from_category(category)
    link_to :controller => "product_category", :action => "destroy", :category_name => category.name, :id => @product do
      image_tag 'delete.png', :size => '15x15', :align => :top
    end
  end

  def add_to_category(category)
    link_to :controller => "product_category", :action => "create", :category_name => category.name, :id => @product do
      image_tag 'add.png', :size => '15x15', :align => :top
    end
  end
  
end
