module CollectionJSON
  class Collection
    attr_reader :href, :links, :items, :queries, :template, :version, :error
    attr_writer :links, :items, :queries, :template, :version, :error

    def self.from_hash(hash)
      self.new(hash[ROOT_NODE]['href']).tap do |collection|
        %w{items links queries error template}.each do |attribute|
          if hash[ROOT_NODE][attribute]
            collection.send("#{attribute}=", hash[ROOT_NODE][attribute])
          end
        end
      end
    end

    def initialize(href)
      @href = CollectionJSON.add_host(href)
      @version = COLLECTION_JSON_VERSION
      @items = []
      @links = []
      @queries = []
      @error = nil
      @template = nil
    end

    def collection
      {ROOT_NODE => body}
    end

    def to_json(*args)
      collection.to_json(args)
    end

    private
    def body
      {href: href, version: version}.tap do |body|
        %w{items links queries}.each do |child_name|
          child = send(child_name)
          body.merge!({child_name => child}) if child.length > 0
        end
        body.merge!({error: error}) if error
        body.merge!({template: template}) if template
      end
    end
  end
end
