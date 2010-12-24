class LineItemsController < ApplicationController
  
  before_filter :authenticate_admin!, :only => [:index, :show]
  
  respond_to :html, :js

  def index
    @line_items = LineItem.all

    respond_with @line_items
  end

  def show
    @line_item = LineItem.find(params[:id])
    
    respond_with @line_item    
  end

  def new
    @line_item = LineItem.new

    respond_with @line_item
  end

  def edit
    @line_item = LineItem.find(params[:id])
    
    respond_with @line_item
  end

  def create
    if params[:line_item][:item_id] == ''
      # user trying to add item with no option selected
      redirect_to session[:"user_return_to"], :alert => 'You did not specify an option to add to the basket.'
    else
      @line_item = @basket.line_items.where(:item_id => params[:line_item][:item_id]).first
      # if the above doesn't return a line item, create a new one
      @line_item ||= @basket.line_items.build({:item_id => params[:line_item][:item_id]})
      if @line_item.save
        # all line items start with zero quantity
        @line_item.increment!(:quantity)
        flash[:notice] = 'Basket updated.'
      else
        flash[:error] = 'Basket update failed.'
      end
      respond_with @line_item.item
    end
  end

  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to(@line_item, :notice => 'Line item was successfully updated.') }
        format.js
      else
        format.html { render :action => "edit" }
        format.js
      end
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to(line_items_url) }
      format.js
    end
  end
end
