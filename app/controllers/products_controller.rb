# -*- encoding : utf-8 -*-
class ProductsController < ApplicationController
  layout 'menu_layout'
  before_filter :logged_in?, :except => :show
  respond_to :html, :xml

  # GET /products
  # GET /products.xml
  def index
    @products = Product.all
    @title = @title + ' - ' + 'Wszystkie dostępne pomoce dydaktyczne, szkolne, naukowe'
    @description = 'Wszystkie dostępne pomoce dydaktyczne, szkolne, naukowe.'
    respond_with @products
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])
    @title = @title + ' - ' + @product.name
    @description = 'Szczegółowy opis i zdjęcia pomocy dydaktycznej, naukowej, szkolnej ' + @product.name
    @keywords += ', oferta, ' + @product.name
    respond_with @product
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new
     @title = @title + ' - ' + 'Nowy produkt'
    respond_with @product
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @title = @title + ' - ' + 'Edycja produktu ' + @product.name
    respond_with @product
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    if @product.save
      flash[:notice] = t('product.product_created')
    end
    respond_with @product
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      flash[:notice] = t('product.product_updated')
    end
    respond_with @product
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_with @product
  end

  def sort_photos
    params[:photos].each_with_index do |id, index|
      Photo.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

end
