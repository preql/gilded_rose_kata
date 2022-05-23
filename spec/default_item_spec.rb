require File.join(File.dirname(__FILE__), "..", "lib", "default_item")

RSpec.describe DefaultItem do
  let(:default_item) { described_class.new("+5 Dexterity Vest", 10, 20) }

  describe "#update" do
    it "decreased sell_in by 1" do
      expect { default_item.update }.to change { default_item.sell_in }.by(-1)
    end

    it "decreased quality by 1" do
      expect { default_item.update }.to change { default_item.quality }.by(-1)
    end

    it "not reduced quality below zero" do
      expect {
        100.times { default_item.update }
      }.to change { default_item.quality }.to(0)
    end

    context "when sell_in expires" do
      before(:each) { 10.times { default_item.update } }

      it "haved a sell_in < 1" do
        expect(default_item.sell_in).to be < 1
      end

      it "decreased quality by 2 after when sell_in < 1" do
        expect {
          default_item.update
        }.to change { default_item.quality }.by(-2)
      end
    end
  end
end
