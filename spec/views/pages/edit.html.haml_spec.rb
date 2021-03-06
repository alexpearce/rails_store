require 'spec_helper'

describe "pages/edit.html.haml" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :new_record? => false,
      :name => "MyString",
      :content => "MyText",
      :permalink => "MyString",
      :links_to => "MyString",
      :order => 1,
      :parent_id => 1
    ))
  end

  it "renders the edit page form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => page_path(@page), :method => "post" do
      assert_select "input#page_name", :name => "page[name]"
      assert_select "textarea#page_content", :name => "page[content]"
      assert_select "input#page_permalink", :name => "page[permalink]"
      assert_select "input#page_links_to", :name => "page[links_to]"
      assert_select "input#page_order", :name => "page[order]"
      assert_select "input#page_parent_id", :name => "page[parent_id]"
    end
  end
end
