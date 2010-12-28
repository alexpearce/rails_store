class CategoriesController < ApplicationController
  
  respond_to :html
  
  def index
    @categories = Category.all

    respond_with @categories
  end

  def show
    @category = Category.find_by_slug(params[:id], :include => :items)

    respond_with @category
  end

  def new
    @category = Category.new

    respond_with @category
  end

  def edit
    @category = Category.find_by_slug(params[:id])
  end


  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to(@category, :notice => 'Category was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @category = Category.find_by_slug(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to(@category, :notice => 'Category was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @category = Category.find_by_slug(params[:id])
    @category.destroy

    respond_with @category
  end
end
