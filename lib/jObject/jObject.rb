require 'json'

module JObject
  class JObject
    attr_accessor :data

    def initialize(data)
      @data = data
      set_attributes(objectify_hash(data))
    end

    private

    def objectify_hash(hash)
      hash.inject({}) do |new_hash, (key, val)|
        if val.class == Hash
          new_hash[key] = JObject.new(val)
        elsif val.class == Array
          new_hash[key] = objectify_array(val)
        else
          new_hash[key] = val
        end
        new_hash
      end
    end

    def objectify_array(array)
      array.map do |item|
        if item.class == Hash
          JObject.new(item)
        elsif item.class == Array
          objectify_array(item)
        else
          item
        end
      end
    end

    def set_attributes(hash)
      hash.each do |key, val|
        singleton_class.class_eval { attr_accessor "#{key}" }
        send("#{key}=", val)
      end
    end
  end
end
