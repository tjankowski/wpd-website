# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  #Zwraca odnośnik do wykorzystania w układzie nawigacji
  def nav_link(text, controller, action="index")
    link_to_unless_current text, :controller => controller, :action => action do
      content_tag :span, text, :id => 'current_site'
    end
  end

  #Zwraca odnośnik do wykorzystania w układzie nawigacji z id
  def nav_link_id(text, controller, action, id)
    link_to_unless_current text, :controller => controller, :action => action, :id => id do
      content_tag :span, text, :id => 'current_site'
    end
  end

  def nav_link_to_object(text, object)
    link_to_unless_current text, object do
      content_tag :span, text, :id => 'current_site'
    end
  end
  
end
