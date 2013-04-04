module SkypeDB
  class Contact < ActiveRecord::Base
    self.table_name = 'Contacts'
    self.inheritance_column = 'object_type'

    has_many :messages, primary_key: :skypename, foreign_key: :author
  end
end
