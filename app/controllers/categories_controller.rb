class CategoriesController < ApplicationController
  layout 'menu_layout', :except => :name_auto_complete
  before_filter :logged_in?, :except => :show
  
  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.search(params[:search_category])
    @title = @title + ' - ' + 'Oferta pomocy dydaktycznych, szkolnych, naukowych'
    @description = 'Oferta pomocy dydaktycznych, szkolnych, naukowych podzielona na kategorie: '
    @keywords += ', oferta, '
    for category in @categories do
      @description += category.name
      @keywords += category.name
      if category == @categories.last
        @description += '. '
      else
        @description += ', '
        @keywords += ', '
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
      format.js
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @categories = Category.find(:all)
    @category = Category.find(params[:id])
    @title = @title + ' - ' + 'Oferta pomocy dydaktycznych, szkolnych, naukowych' + ' - ' + @category.name
    @description = 'Oferta pomocy dydaktycznych, szkolnych, naukowych dla ' + @category.name
    @keywords += ', oferta, ' + @category.name
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new
    @title = @title + ' - ' + 'Nowa kategoria'
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
    @title = @title + ' - ' + 'Edycja kategorii ' + @category.name
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])
    @category.position = 100;

    respond_to do |format|
      if @category.save
        flash[:notice] = t('category.category_created')
        format.html { redirect_to(@category) }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = t('category.category_updated')
        format.html { redirect_to(@category) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(categories_url) }
      format.xml  { head :ok }
    end
  end

  def name_auto_complete
    @categories = Category.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:search].downcase}%"])
  end

  def sort_menu
    params[:categories].each_with_index do |id, index|
      Category.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

  def sort_products
    @category = Category.find(params[:category_id])
    params[:products].each_with_index do |id, index|
      ProductCategory.update_all(['position=?', index+1], ['product_id=? AND category_id=?', id, @category.id])
    end
    render :nothing => true
  end
  
end
