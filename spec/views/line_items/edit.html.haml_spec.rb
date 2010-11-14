require 'spec_helper'

describe "line_items/edit.html.haml" do
  before(:each) do
    @line_item = assign(:line_item, stub_model(LineItem,
      :new_record? => false,
      :item_id => 1,
      :basket_id => 1
    ))
  end

  it "renders the edit line_item form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => line_item_path(@line_item), :method => "post" do
      assert_select "input#line_item_item_id", :name => "line_item[item_id]"
      assert_select "input#line_item_basket_id", :name => "line_item[basket_id]"
    end
  end
end
