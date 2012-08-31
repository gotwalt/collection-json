require_relative '../attribute'

module CollectionJSON
  class Link < Attribute
    attribute :href, transform: URI
    attribute :rel
    attribute :name
    attribute :render
    attribute :prompt
    attribute :inline
  end
end
