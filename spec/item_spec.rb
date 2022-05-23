require File.join(File.dirname(__FILE__), "..", "lib", "item")

RSpec.describe Item do
  let(:item) { described_class.new("foo", 1, 2) }

  it { expect(item).to respond_to(:name) }
  it { expect(item).to respond_to(:sell_in) }
  it { expect(item).to respond_to(:quality) }

  it { expect(item).not_to respond_to(:random_value) }
end
