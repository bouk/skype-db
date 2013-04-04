module SkypeDB
  class Message < ActiveRecord::Base
    self.table_name = 'Messages'
    self.inheritance_column = 'object_type'

    belongs_to :contact, foreign_key: :author

    # type 61 are chat messages instead of friend requests etc.
    default_scope where(type: 61)

    def body
      '' if body_xml.empty?
      body_xml.gsub(/<.*?>/, '')
    end

    def body?
      body_xml?
    end
  end
end
