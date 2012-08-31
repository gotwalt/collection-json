require 'spec_helper'
require 'collection-json/attributes/item'

describe CollectionJSON::Item do
  it 'be serializable' do
    item = CollectionJSON::Item.from_hash({
      href: 'http://www.example.com',
      links: [
        {href: 'http://www.example.com/place'},
        {href: 'test_inline_href', rel: 'test', inline: true }
      ],
      data: [{name: 'full-name', value: 'phil'}],
      inline: {
        'test_inline_href' => {
          collection: { 
            href: '/inline',
            links: [{href: '/place'}],
            inline: {},
            data: [{name: 'full-name', value: 'phil'}]
          }
        }
      }
    })
    item.to_json.class.should eq(String)
  end
end
