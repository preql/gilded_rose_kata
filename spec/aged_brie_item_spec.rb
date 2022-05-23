require File.join(File.dirname(__FILE__), "..", "lib", "aged_brie_item")

RSpec.describe AgedBrieItem do
  let(:aged_brie_item) { described_class.new("Aged Brie", 4, 2) }

  describe "#update" do
    it "decreased sell_in by 1" do
      expect { aged_brie_item.update }.to change { aged_brie_item.sell_in }.by(-1)
    end

    it "increased quality by 1" do
      expect { aged_brie_item.update }.to change { aged_brie_item.quality }.by(1)
    end

    it "not increased quality higher 50" do
      expect {
        100.times { aged_brie_item.update }
      }.to change { aged_brie_item.quality }.to(50)
    end

    context "when sell_in expires" do
      before(:each) { 10.times { aged_brie_item.update } }

      it "haved a sell_in < 1" do
        expect(aged_brie_item.sell_in).to be < 1
      end

      it "increased quality by 1 after when sell_in < 1" do
        expect {
          aged_brie_item.update
        }.to change { aged_brie_item.quality }.by(1)
      end
    end
  end
end
