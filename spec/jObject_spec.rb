require 'spec_helper'

describe JObject do
  it 'has a version number' do
    expect(JObject::VERSION).not_to be nil
  end

  describe ".parse" do
    subject { described_class.parse(json) }

    let(:json) { '{ "name": "bob" }' }

    it "should return a parsed jObject" do
      expect(subject).to be_a JObject::JObject
      expect(subject).to have_attributes(name: "bob")
    end
  end

  describe ".parse_each" do
    subject { described_class.parse_each(json) }

    let(:json) { '[{ "name": "bob" }, { "name": "george" }]' }

    it "should return a parsed array of jObjects" do
      expect(subject).to be_an Array
      expect(subject).to all be_a JObject::JObject
      expect(subject[0].name).to eq "bob"
      expect(subject[1].name).to eq "george"
    end
  end
end
