class ItemsController < ApplicationController
  
  before_filter :authenticate_admin!, :except => [:index, :show, :search, :recent]
  
  respond_to :html
  
  def recent
    @items = Item.find(:all, :order => 'id desc', :limit => 6)
    
    respond_with @items
  end
  
  def index
    @items = Item.where(:parent_id => nil)
    
    respond_with @items
  end
  
  def search
    @items = Item.search(params[:search])
    @items.count == 0 ?
      redirect_to(items_path, :notice => 'No items matched your search.') : render(:search)
  end

  def show
    @item = Item.find(params[:id], :include => :categories)
    @line_item = LineItem.new(:item_id => @item.id)
    @item.parent ?
      redirect_to(item_path(@item.parent), :flash => flash) : respond_with(@item)
  end

  def new
    if params[:parent_id]
      @parent = Item.find(params[:parent_id])
      @item = @parent.children.new(
        :price => @parent.price,
        :stock => @parent.stock,
        :postage => @parent.postage
      )
    else
      @item = Item.new
    end

    respond_with @item
  end

  def edit
    @item = Item.find(params[:id])
    @children = @item.children
        
    respond_with @item
  end

  def create
    @item = Item.new(params[:item])
    @item.categories.build(params[:item][:category]) if params[:item][:category]
    @item.save ?
      flash[:notice] = 'New item successfully created.' :  flash[:notice] = 'New item not successfully created.'
    
    respond_with @item
  end

  def update
    @item = Item.find(params[:id])
    params[:item][:category_ids] ||= []
    if @item.update_attributes(params[:item])
      flash[:notice] = 'Item successfully updated.'
    else
      @children = @item.children
      flash[:error] = 'Item not successfully updated.'
    end
    
    respond_with @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy ?
      flash[:notice] = 'Item successfully destroyed.' : flash[:alert] = 'Destroy unsuccessful. Item may be referenced by line items.'
    
    respond_with @item
  end
end
