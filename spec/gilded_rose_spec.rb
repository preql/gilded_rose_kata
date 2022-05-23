require File.join(File.dirname(__FILE__), "..", "lib", "gilded_rose")

RSpec.describe GildedRose do
  let(:items) {
    [
      Item.new("+5 Dexterity Vest", 10, 20),
      Item.new("Aged Brie", 2, 0),
      Item.new("Elixir of the Mongoose", 5, 7),
      Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
      Item.new("Sulfuras, Hand of Ragnaros", -1, 80),
      Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
      Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 49),
      Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 49),
      Item.new("Conjured Mana Cake", 3, 6)
    ]
  }

  let(:gilded_rose) { described_class.new(items) }

  it { expect(gilded_rose).to respond_to(:update_quality) }
  it { expect(gilded_rose).to respond_to(:items) }
  it { expect(gilded_rose).not_to respond_to(:random_value) }

  it "haven't any items that are an instance of Item" do
    gilded_rose.items.each do |item|
      expect(item).to_not be_an_instance_of(Item)
    end
  end

  describe "#update_quality" do
    context "when number interations:" do
      context "1 day result" do
        before(:each) { gilded_rose.update_quality }

        it "changed after day" do
          expect(gilded_rose.items.map(&:to_s))
            .to match_array(["+5 Dexterity Vest, 9, 19",
              "Aged Brie, 1, 1",
              "Elixir of the Mongoose, 4, 6",
              "Sulfuras, Hand of Ragnaros, 0, 80",
              "Sulfuras, Hand of Ragnaros, -1, 80",
              "Backstage passes to a TAFKAL80ETC concert, 14, 21",
              "Backstage passes to a TAFKAL80ETC concert, 9, 50",
              "Backstage passes to a TAFKAL80ETC concert, 4, 50",
              "Conjured Mana Cake, 2, 4"])
        end
      end

      context "2 day result" do
        before(:each) { 2.times { gilded_rose.update_quality } }

        it "changed after 2 days" do
          expect(gilded_rose.items.map(&:to_s))
            .to match_array(["+5 Dexterity Vest, 8, 18",
              "Aged Brie, 0, 2",
              "Elixir of the Mongoose, 3, 5",
              "Sulfuras, Hand of Ragnaros, 0, 80",
              "Sulfuras, Hand of Ragnaros, -1, 80",
              "Backstage passes to a TAFKAL80ETC concert, 13, 22",
              "Backstage passes to a TAFKAL80ETC concert, 8, 50",
              "Backstage passes to a TAFKAL80ETC concert, 3, 50",
              "Conjured Mana Cake, 1, 2"])
        end
      end

      context "3 day result" do
        before(:each) { 3.times { gilded_rose.update_quality } }

        it "changed after 3 days" do
          expect(gilded_rose.items.map(&:to_s))
            .to match_array(["+5 Dexterity Vest, 7, 17",
              "Aged Brie, -1, 3",
              "Elixir of the Mongoose, 2, 4",
              "Sulfuras, Hand of Ragnaros, 0, 80",
              "Sulfuras, Hand of Ragnaros, -1, 80",
              "Backstage passes to a TAFKAL80ETC concert, 12, 23",
              "Backstage passes to a TAFKAL80ETC concert, 7, 50",
              "Backstage passes to a TAFKAL80ETC concert, 2, 50",
              "Conjured Mana Cake, 0, 0"])
        end
      end

      context "15 day result" do
        before(:each) { 15.times { gilded_rose.update_quality } }
        it "changed after 15 days" do
          expect(gilded_rose.items.map(&:to_s))
            .to match_array(["+5 Dexterity Vest, -5, 0",
              "Aged Brie, -13, 15",
              "Elixir of the Mongoose, -10, 0",
              "Sulfuras, Hand of Ragnaros, 0, 80",
              "Sulfuras, Hand of Ragnaros, -1, 80",
              "Backstage passes to a TAFKAL80ETC concert, 0, 50",
              "Backstage passes to a TAFKAL80ETC concert, -5, 0",
              "Backstage passes to a TAFKAL80ETC concert, -10, 0",
              "Conjured Mana Cake, -12, 0"])
        end
      end
    end
  end
end
