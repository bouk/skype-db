module SkypeDB
  class Message < ActiveRecord::Base
    self.table_name = 'Messages'
    self.inheritance_column = 'object_type'

    belongs_to :contact, primary_key: :skypename, foreign_key: :author

    def body
      '' if body_xml.empty?
      body_xml.gsub(/<.*?>/, '')
    end

    def body?
      body_xml?
    end
  end
end
