module ApplicationHelper
  
  def title(title)
    content_for(:title) { title }
    content_tag(:h1, title)
  end
  
  def ntc(num)
    number_to_currency(num, :unit => '&pound;').html_safe
  end
  
  def nav_collection
    Page.where("published = '1'").find_all_by_parent_id(nil)
  end
  
  #
  def classifier_class
    "#{controller.controller_name} #{controller.action_name}"
  end
end