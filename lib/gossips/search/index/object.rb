module Gossips
  class Search
    class Index
      class Object
        def initialize(object = {})
          @object = object.is_a?(Hash) ? object.stringify_keys : JSON.parse(object)
        end

        def id
          "#{@object['model'].to_s.downcase}_#{@object['id']}_#{@object['tag_id']}"
        end

        def to_h
          {
            object_kls: @object['model'],
            object_id: @object['id'],
            object_created_at: @object['created_at'].try(:strftime, '%Y-%m-%d %H:%M:%S'),
            tag_id: @object['tag_id'],
            tag_kls: @object['tag_kls'],
            tag_type: @object['tag_type'],
            tag_name: @object['tag_name'],
            last_updated: @object['last_updated'].try(:strftime, '%Y-%m-%d %H:%M:%S')
          }
        end
      end
    end
  end
end