require File.join(File.dirname(__FILE__), "default_item")

class BackstagePassesItem < DefaultItem
  def update
    @sell_in -= 1
    return @quality = 0 if @sell_in < 0
    @quality += 1
    @quality += 1 if @sell_in < 10
    @quality += 1 if @sell_in < 5
    @quality = 50 if @quality >= 50
  end
end
