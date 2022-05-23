require File.join(File.dirname(__FILE__), "default_item")

class AgedBrieItem < DefaultItem
  def update
    @quality += 1

    @quality = 50 if @quality > 50

    @sell_in -= 1
  end
end
