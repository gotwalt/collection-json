require 'spec_helper'
require 'collection-json/attributes/collection'

describe CollectionJSON::Collection do
  it 'be serializable' do
    collection = CollectionJSON::Collection.from_hash({
      href: '/',
      links: [{href: '/place'}],
      items: [{ data: [{name: 'full-name', value: 'phil'}] }]
      })
    collection.to_json.class.should eq(String)
  end
end
