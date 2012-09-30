class SearchController < ApplicationController
  layout 'site'
  
  def index
    @title =  @title + ' - ' + 'Wyszukiwarka pomocy dydaktycznych, szkolnych i naukowych'
    @description = 'Wyszukiwarka pomocy dydaktycznych, szkolnych i naukowych. Wyszukuje dostępne pomoce dydaktyczne, naukowe i szkolne oraz kategorie.'
    @keywords += ', wyszukiwarka, szukaj, search, find'
    if params[:search]
      query = params[:search]
      @products = Product.find_with_ferret(query)
      @categories = Category.find_with_ferret(query)
      @pages = Page.find_with_ferret(query)
    end
  end

end
