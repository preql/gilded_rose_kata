require File.join(File.dirname(__FILE__), "item_factory")

class GildedRose
  attr_reader :items

  def initialize(items, factory = ItemFactory.new)
    @items = transform(items, factory)
  end

  def update_quality
    @items.each { |item| item.update }
  end

  private

  def transform(items, factory)
    items.map { |item| factory.create(item) }
  end
end
