module SkypeDB
  class Message < ActiveRecord::Base
    self.table_name = 'Messages'
    self.inheritance_column = 'object_type'
  end
end
