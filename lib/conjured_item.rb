require File.join(File.dirname(__FILE__), "default_item")

class ConjuredItem < DefaultItem
  def update
    @quality -= @sell_in > 0 ? 2 : 4

    @quality = 0 if @quality < 0

    @sell_in -= 1
  end
end
