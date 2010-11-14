require "spec_helper"

describe LineItemsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/line_items" }.should route_to(:controller => "line_items", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/line_items/new" }.should route_to(:controller => "line_items", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/line_items/1" }.should route_to(:controller => "line_items", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/line_items/1/edit" }.should route_to(:controller => "line_items", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/line_items" }.should route_to(:controller => "line_items", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/line_items/1" }.should route_to(:controller => "line_items", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/line_items/1" }.should route_to(:controller => "line_items", :action => "destroy", :id => "1")
    end

  end
end
