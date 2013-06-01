# -*- encoding : utf-8 -*-
class SiteController < ApplicationController
  layout 'site'
  
  def index
    @title = @title + ' - ' + ''
    @description = 'Firma Wytwarzanie Pomocy Dydaktycznych specjalizuje się w wytwarzaniu pomocy dydaktycznych, szkolnych i naukowych dla przedszkoli i szkół.'
    @categories = Category.search ''
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def about
    respond_to do |format|
      format.html # about.html.erb
    end
  end

  def contact
    respond_to do |format|
      format.html # contact.html.erb
    end
  end

end
