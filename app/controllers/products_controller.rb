class ProductsController < ApplicationController
  layout 'menu_layout'
  before_filter :logged_in?, :except => :show

  # GET /products
  # GET /products.xml
  def index
    @products = Product.all
    @title = @title + ' - ' + 'Wszystkie dostępne pomoce dydaktyczne, szkolne, naukowe'
    @description = 'Wszystkie dostępne pomoce dydaktyczne, szkolne, naukowe.'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])
    @title = @title + ' - ' + @product.name
    @description = 'Szczegółowy opis i zdjęcia pomocy dydaktycznej, naukowej, szkolnej ' + @product.name
    @keywords += ', oferta, ' + @product.name
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new
     @title = @title + ' - ' + 'Nowy produkt'
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @title = @title + ' - ' + 'Edycja produktu ' + @product.name
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice] = t('product.product_created')
        format.html { redirect_to(@product) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = t('product.product_updated')
        format.html { redirect_to(@product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end

  def sort_photos
    params[:photos].each_with_index do |id, index|
      Photo.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

end
