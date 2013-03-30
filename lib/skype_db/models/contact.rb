module SkypeDB
  class Contact < ActiveRecord::Base
    self.table_name = 'Contacts'
    self.inheritance_column = 'object_type'
  end
end
