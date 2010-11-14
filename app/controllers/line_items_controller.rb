class LineItemsController < ApplicationController
  
  respond_to :html

  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @line_items }
    end
  end

  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  def edit
    @line_item = LineItem.find(params[:id])
  end

  def create
    item = Item.find(params[:item_id])
    @line_item = LineItem.where(:basket_id => @basket.id, :item_id => item.id).first
    @line_item ||= @basket.line_items.build(:item => item)
    if @line_item.save
      @line_item.increment!(:quantity)
      flash[:notice] = 'Basket updated.'
    else
      flash[:error] = 'Basket update failed.'
    end
    respond_with @line_item.item
  end

  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to(@line_item, :notice => 'Line item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to(line_items_url) }
      format.xml  { head :ok }
    end
  end
end
