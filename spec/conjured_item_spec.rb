require File.join(File.dirname(__FILE__), "..", "lib", "conjured_item")

RSpec.describe ConjuredItem do
  let(:conjured_item) { described_class.new("Conjured Mana Cake", 10, 40) }

  describe "#update" do
    it "decreased sell_in by 1" do
      expect { conjured_item.update }.to change { conjured_item.sell_in }.by(-1)
    end

    it "decreased quality by 2 when sell in > 1" do
      expect { conjured_item.update }.to change { conjured_item.quality }.by(-2)
    end

    it "not reduced quality below zero" do
      expect {
        100.times { conjured_item.update }
      }.to change { conjured_item.quality }.to(0)
    end

    context "when sell_in expires" do
      before(:each) { 10.times { conjured_item.update } }

      it "haved a sell_in < 1" do
        expect(conjured_item.sell_in).to be < 1
      end

      it "decreased quality by 4 after when sell_in < 1" do
        expect {
          conjured_item.update
        }.to change { conjured_item.quality }.by(-4)
      end
    end
  end
end
