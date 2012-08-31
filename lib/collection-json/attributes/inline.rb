require_relative '../attribute'
require_relative 'collection'

module CollectionJSON
  class Inline < Attribute
    attribute :inline,        
              transform:      lambda { |inline|
                                inline.each.inject({}) do |collector, (key, value)|
                                  collector[key] = self.from_hash(value)
                                  collector
                                end 
                              }
  end
end