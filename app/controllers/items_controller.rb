class ItemsController < ApplicationController
  
  before_filter :authenticate_admin!, :except => [:index, :show]
  
  respond_to :html
  
  def index
    @items = Item.where(:parent_id => nil)
    
    respond_with @items
  end

  def show
    @item = Item.find(params[:id])
    @line_item = LineItem.new(:item_id => @item.id)
    redirect_to item_path(@item.parent), :flash => flash if @item.parent
    respond_with @item unless @item.parent
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
    
    if @item.save
      flash[:notice] = 'New item successfully created.'
    else
      flash[:notice] = 'New item not successfully created.'
    end
    
    respond_with @item
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(params[:item])
      flash[:notice] = 'Item successfully updated.'
    else
      flash[:error] = 'Item not successfully updated.'
    end
    
    respond_with @item
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = 'Item successfully destroyed.'
    else
      flash[:alert] = 'Destroy unsuccessful. Item may be referenced by line items.'
    end
    
    respond_with @item
  end
end
