require 'yaml'

require_relative './sql_object'
# require_relative '../config/database.yml'

database_file = begin
  dir = File.dirname(__FILE__)
  database_config_path = File.join(dir, '../..', '/config/database.yml')

  YAML.load(File.open(database_config_path))
rescue ArgumentError => e
  puts "Could not parse database file: #{e.message}"

end

# this works for sqlite, will need a more adaptive solution for postgres support
  dir = File.dirname(__FILE__)
  database_path = File.join(dir, '../..', "/db/sqlite_db/#{database_file['default']['database']}.db")
begin
  SQL_DB = database_path
  DBConnection.open(SQL_DB)
rescue ArgumentError => e
  puts "Could not open database file: #{e.message}"
  exit(1);
end



class ModelBase < SQLObject


end
