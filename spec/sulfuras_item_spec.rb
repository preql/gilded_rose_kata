require File.join(File.dirname(__FILE__), "..", "lib", "sulfuras_item")

RSpec.describe SulfurasItem do
  let(:sulfuras_item) { described_class.new("Sulfuras, Hand of Ragnaros", 0, 80) }

  describe "#update" do
    it "not touched quality of legendary item" do
      expect { sulfuras_item.update }.to_not change { sulfuras_item.quality }
    end
  end
end
