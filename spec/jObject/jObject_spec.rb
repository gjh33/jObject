require 'spec_helper'

RSpec.describe JObject::JObject do
  let(:json) { '{ "name": "bob", "addresses": [ { "postal_code": "a1a 1a1" }, { "postal_code": "b2b 2b2" } ] }' }

  let(:data_hash) { JSON.parse(json) }

  subject { described_class.new(data_hash) }

  it "returns a an object with shallow attributes" do
    expect(subject.name).to eq "bob"
  end

  it "returns array attributes with sub hashes as jObjects" do
    expect(subject.addresses).to all be_a JObject::JObject
  end

  it "correctly and recursively objectifies sub objects" do
    expect(subject.addresses.first.postal_code).to eq "a1a 1a1"
  end
end
