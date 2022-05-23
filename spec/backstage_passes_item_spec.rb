require File.join(File.dirname(__FILE__), "..", "lib", "backstage_passes_item")

RSpec.describe BackstagePassesItem do
  let(:backstage_item) {
    described_class.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
  }

  describe "#update" do
    context "when sell_in > 10" do
      it "haved a sell_in > 10" do
        expect(backstage_item.sell_in).to be > 10
      end

      it "increased quality by 1 on update" do
        expect { backstage_item.update }.to change { backstage_item.quality }.by(1)
      end
    end

    context "when sell_in <= 10" do
      before(:each) { 5.times { backstage_item.update } }

      it "haved a sell_in <= 10" do
        expect(backstage_item.sell_in).to be <= 10
      end

      it "increased quality by 1 on update" do
        expect { backstage_item.update }.to change { backstage_item.quality }.by(2)
      end
    end

    context "when sell_in <= 5" do
      before(:each) { 10.times { backstage_item.update } }

      it "haved a sell_in <= 5" do
        expect(backstage_item.sell_in).to be <= 5
      end

      it "increased quality by 1 on update" do
        expect { backstage_item.update }.to change { backstage_item.quality }.by(3)
      end
    end

    context "when quality near by 50" do
      let(:backstage_item) {
        described_class.new("Backstage passes to a TAFKAL80ETC concert", 10, 45)
      }

      it "not increased quality higher 50" do
        expect {
          6.times { backstage_item.update }
        }.to change { backstage_item.quality }.to(50)
      end
    end

    context "when sell_in expires" do
      before(:each) { 15.times { backstage_item.update } }

      it "haved a sell_in < 1" do
        expect(backstage_item.sell_in).to be < 1
      end

      it "decreased quality to zero" do
        expect {
          backstage_item.update
        }.to change { backstage_item.quality }.to(0)
      end
    end
  end
end
