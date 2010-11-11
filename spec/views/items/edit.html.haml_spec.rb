require 'spec_helper'

describe "items/edit.html.haml" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :new_record? => false,
      :name => "MyString",
      :price => 1.5,
      :stock => 1,
      :description => "MyText",
      :image => "MyString"
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => item_path(@item), :method => "post" do
      assert_select "input#item_name", :name => "item[name]"
      assert_select "input#item_price", :name => "item[price]"
      assert_select "input#item_stock", :name => "item[stock]"
      assert_select "textarea#item_description", :name => "item[description]"
      assert_select "input#item_image", :name => "item[image]"
    end
  end
end
