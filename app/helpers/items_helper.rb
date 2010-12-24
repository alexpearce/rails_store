module ItemsHelper
  def options_select(name, price, stock)
    if stock == 0
      "#{name} - #{sprintf("%.2f", price)} (Sold Out)"
    else
      "#{name} - #{sprintf("%.2f", price)}"
    end
  end
end
