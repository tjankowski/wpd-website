# -*- encoding : utf-8 -*-
class ProductCategoryController < ApplicationController
  layout 'menu_layout'
  before_filter :logged_in?

  def index
    @product = Product.find(params[:id])
    @categories = Category.search(params[:category_name])
    @title = 'Dodawanie ' + @product.name + ' do kategorii' + ' - ' + @title
    @description = 'Wytwarzanie Pomocy Dydaktycznych. ' + 'Dodawanie ' + @product.name + ' do kategorii'
    respond_to do |format|
      format.html
      format.xml  { render :xml => @product.categories }
      format.js
    end
  end

  def create
    @product = Product.find(params[:id])
    @category = Category.find_or_create_by_name(params[:category][:name])
    unless @product.belongs_to_category?(@category)
      @product.categories << @category
    end
    respond_to do |format|
      format.html  {redirect_to :action => 'index', :id => @product}
      format.xml  { render :xml => @product.categories }
      format.js
    end
    
  end

  def destroy
    @product = Product.find(params[:id])
    @category = Category.find_by_name(params[:category][:name])
    if @product.belongs_to_category?(@category)
      @product.categories.delete(@category)
    end
    
    respond_to do |format|
      format.html  {redirect_to :action => 'index', :id => @product}
      format.xml  { render :xml => @product.categories }
    end
  end

end
