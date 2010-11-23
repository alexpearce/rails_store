module ApplicationHelper
  def title(title)
    content_for(:title) { title }
    content_tag(:h1, title)
  end
  
  def ntc(num)
    number_to_currency(num, :unit => '&pound;').html_safe
  end
end
