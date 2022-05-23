require File.join(File.dirname(__FILE__), "default_item")
require File.join(File.dirname(__FILE__), "aged_brie_item")
require File.join(File.dirname(__FILE__), "sulfuras_item")
require File.join(File.dirname(__FILE__), "backstage_passes_item")
require File.join(File.dirname(__FILE__), "conjured_item")

class ItemFactory
  DEFAULT_CLASS = DefaultItem
  SPECIALIZED_CLASSES = {
    "Aged Brie" => AgedBrieItem,
    "Sulfuras, Hand of Ragnaros" => SulfurasItem,
    "Backstage passes to a TAFKAL80ETC concert" => BackstagePassesItem,
    "Conjured Mana Cake" => ConjuredItem
  }

  def initialize(types = SPECIALIZED_CLASSES)
    @types = types
  end

  def create(item)
    identify(item.name).new(item.name, item.sell_in, item.quality)
  end

  private

  def identify(name)
    @types.fetch(name, DEFAULT_CLASS)
  end
end
