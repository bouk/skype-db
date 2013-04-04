module SkypeDB
  class Contact < ActiveRecord::Base
    self.table_name = 'Contacts'
    self.inheritance_column = 'object_type'
    default_scope order('skypename')

    has_many :messages, primary_key: :skypename, foreign_key: :author
  end
end
