class ItemsController < ApplicationController
  
  respond_to :html
  
  def index
    @items = Item.where(:item_id => nil)
    
    respond_with(@items)
  end

  def show
    @item = Item.find(params[:id])

    respond_with(@item)
  end

  def new
    @item = Item.new

    respond_with(@item)
  end

  def edit
    @item = Item.find(params[:id])
    
    respond_with(@item)
  end

  def create
    @item = Item.new(params[:item])
    
    if @item.save
      flash[:notice] = 'New item successfully created.'
    else
      flash[:notice] = 'New item not successfully created.'
    end
    
    respond_with(@item)
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(params[:item])
      flash[:notice] = 'Item successfully updated.'
    else
      flash[:error] = 'Item not successfully updated.'
    end
    
    respond_with(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = 'Item successfully destroyed.'
    else
      flash[:alert] = 'Destroy unsuccessful. Item may be referenced by line items.'
    end
    
    respond_with(@item)
  end
end
