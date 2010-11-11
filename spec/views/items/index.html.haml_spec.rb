require 'spec_helper'

describe "items/index.html.haml" do
  before(:each) do
    assign(:items, [
      stub_model(Item,
        :name => "Name",
        :price => 1.5,
        :stock => 1,
        :description => "MyText",
        :image => "Image"
      ),
      stub_model(Item,
        :name => "Name",
        :price => 1.5,
        :stock => 1,
        :description => "MyText",
        :image => "Image"
      )
    ])
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
