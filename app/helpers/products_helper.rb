# -*- encoding : utf-8 -*-
module ProductsHelper

  def add_photo_link(name)
    link_to_function(image_tag('picture.png', :size => '15x15', :align => :top)+" "+name) do |page|
      page.insert_html :bottom, :photos, :partial => 'new_photo', :object => Photo.new
    end
  end

  def remove_photo_field
    link_to_function(image_tag('delete.png', :size => '15x15')+" "+t('delete'), "this.up('.photo').remove()")
  end

  def mark_for_destroy
    link_to_function(image_tag('delete.png', :size => '15x15')+" "+t('delete'), "mark_for_destroy(this)")
  end
  
end
