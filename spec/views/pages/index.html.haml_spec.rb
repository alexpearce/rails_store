require 'spec_helper'

describe "pages/index.html.haml" do
  before(:each) do
    assign(:pages, [
      stub_model(Page,
        :name => "Name",
        :content => "MyText",
        :permalink => "Permalink",
        :links_to => "Links To",
        :order => 1,
        :parent_id => 1
      ),
      stub_model(Page,
        :name => "Name",
        :content => "MyText",
        :permalink => "Permalink",
        :links_to => "Links To",
        :order => 1,
        :parent_id => 1
      )
    ])
  end

  it "renders a list of pages" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Permalink".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Links To".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
