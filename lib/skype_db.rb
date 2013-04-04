require 'active_record'

module SkypeDB
  VERSION = "0.0.1"

  class << self
    def db_path
      found_files = Dir.glob([
        # OSX
        File.join(Dir.home, 'Library', 'Application Support', 'Skype', '**', 'main.db'),
        # Linux
        File.join(Dir.home, '.Skype', '**', 'main.db'),
      ])

      return found_files.first unless found_files.empty?
      raise 'Unsupported operating system'
    end

    def connect(path = self.db_path)
      ActiveRecord::Base.establish_connection(
        :adapter => 'sqlite3',
        :database => path
      )
    end
  end
end

SkypeDB.connect

Dir[File.join(File.dirname(File.absolute_path(__FILE__)), "skype_db", "models", "*.rb")].each do |f|
  require f
end
