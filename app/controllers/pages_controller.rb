class PagesController < ApplicationController
  layout :select_layout
  before_filter :logged_in?, :except => :show

  # GET /pages
  # GET /pages.xml
  def index
    @pages = Page.all
    @title = @title + ' - ' + 'Strony'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])
    @title = @title + ' - ' + @page.title
    @description = 'Wytwarzanie Pomocy Dydaktycznych - ' + @page.title
    @keywords += ', ' + @page.title
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new
    @title = @title + ' - ' + 'Nowa strona'
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
    @title = @title + ' - ' + 'Edycja strony ' + @page.title
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        flash[:notice] = t('page.page_created')
        format.html { redirect_to(@page) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = t('page.page_updated')
        format.html { redirect_to(@page) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end

  def preview
    @page = Page.find(params[:id])
    @pages = Page.find(:all)
    @title = @title + ' - ' + 'Podgląd ' + @page.title

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  private
  
  def select_layout
    [ 'show' ].include?(action_name) ? "site" : "menu_layout"
  end

end
