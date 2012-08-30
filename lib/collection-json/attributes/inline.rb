require_relative '../attribute'
require_relative 'data'
require_relative 'link'

module CollectionJSON
  class Inline < Attribute
    attribute :href, transform: URI
    attribute :data,
              transform:      lambda { |data| data.each.map{ |d| Data.from_hash(d) }},
              default:        [],
              find_method:    {method_name: :datum, key: 'name'}
    attribute :links,
              transform:      lambda { |links| links.each.map { |l| Link.from_hash(l) }},
              default:        [],
              find_method:    :link
    attribute :inline,        
              transform:      lambda { |inline|
                                inline.each.inject({}) do |collector, (key, value)|
                                  collector[key] = self.from_hash(value)
                                  collector
                                end 
                              }
  end
end