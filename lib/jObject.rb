require "jObject/version"
require 'jObject/jObject'
require 'json'

module JObject
  def self.parse(json)
    data_hash = JSON.parse(json)
    JObject.new(data_hash)
  end

  def self.parse_each(json)
    data_array = JSON.parse(json)
    data_array.map do |hash|
      JObject.new(hash)
    end
  end
end
