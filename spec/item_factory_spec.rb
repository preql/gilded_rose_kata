require File.join(File.dirname(__FILE__), "..", "lib", "item_factory")

RSpec.describe ItemFactory do
  let(:item_factory) { described_class.new }
  let(:default_item) { Item.new("+5 Dexterity Vest", 1, 2) }
  let(:brie_item) { Item.new("Aged Brie", 1, 2) }
  let(:sulfur_item) { Item.new("Sulfuras, Hand of Ragnaros", 1, 2) }
  let(:backstage_item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 2) }
  let(:conjured_item) { Item.new("Conjured Mana Cake", 1, 2) }

  describe "#create" do
    it "creates a basic item" do
      expect(item_factory.create(default_item)).to be_kind_of(Item)
    end

    it "creates a Aged Brie item" do
      expect(item_factory.create(brie_item)).to be_kind_of(Item)
    end

    it "creates a Sulfuras item" do
      expect(item_factory.create(sulfur_item)).to be_kind_of(Item)
    end

    it "creates a Backstage item" do
      expect(item_factory.create(backstage_item)).to be_kind_of(Item)
    end

    it "creates a Conjured item" do
      expect(item_factory.create(conjured_item)).to be_kind_of(Item)
    end
  end
end
