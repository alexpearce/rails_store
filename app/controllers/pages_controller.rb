class PagesController < ApplicationController
  
  before_filter :authenticate_admin!, :except => [:show]
  
  respond_to :html
  
  def index
    @pages = Page.all

    respond_with @pages
  end
  
  def show
    @page = Page.find_by_permalink(params[:id])
    
    # if the or request.. condition is deleted, the root route breaks
    # due to a redirect loop
    unless @page.links_to.blank? or request.path == @page.links_to
      # preserve flash messages
      flash.keep
      redirect_to @page.links_to 
    else
      respond_with @page
    end
  end

  def new
    @page = Page.new

    respond_with @page
  end

  def edit
    @page = Page.find_by_permalink(params[:id])
    
    respond_with @page
  end

  def create
    @page = Page.new(params[:page])

    flash[:notice] = 'Page was successfully created.' if @page.save
    flash[:error] = 'Page was not created successfully.' unless @page.save
      
    respond_with @page
  end

  def update
    @page = Page.find_by_permalink(params[:id])

    if @page.update_attributes(params[:page])
      flash[:notice] = 'Page was successfully updated.'
    else
      flash[:error] = 'Page was not successfully updated.'
    end
    
    respond_with @page
  end

  def destroy
    @page = Page.find_by_permalink(params[:id])
    @page.destroy

    flash[:notice] = 'Page successfully destroyed.'
    
    respond_with @page
  end
end
