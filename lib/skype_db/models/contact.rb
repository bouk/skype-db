module SkypeDB
  class Contact < ActiveRecord::Base
    self.table_name = 'Contacts'
    self.inheritance_column = 'object_type'
    self.primary_key = 'skypename'

    default_scope order('skypename')

    has_many :messages, foreign_key: :author
  end
end
