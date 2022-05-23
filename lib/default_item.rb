require File.join(File.dirname(__FILE__), "item")

class DefaultItem < Item
  def update
    @quality -= @sell_in > 0 ? 1 : 2

    @quality = 0 if @quality < 0

    @sell_in -= 1
  end
end
