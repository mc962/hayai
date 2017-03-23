require 'sqlite3'
require 'yaml'

require 'byebug'
PRINT_QUERIES = ENV['PRINT_QUERIES'] == 'true'


  database_file = begin
    dir = File.dirname(__FILE__)
    database_config_path = File.join(dir, '../..', '/config/database.yml')

    YAML.load(File.open(database_config_path))
  rescue ArgumentError => e
    puts "Could not parse database file: #{e.message}"

  end

  # this works for sqlite, will need a more adaptive solution for postgres support
  dir = File.dirname(__FILE__)
  DB_NAME = "#{database_file['default']['database']}.db"
  SQL_NAME = "#{database_file['default']['database']}.sql"
  DB_PATH = File.join(dir, '../..', "/db/sqlite_db/#{DB_NAME}")
  SQL_PATH = File.join(dir, '../..', "/db/sqlite_sql/#{SQL_NAME}")


class DBConnection


  def self.open(db_file_name)
    @db = SQLite3::Database.new(db_file_name)
    @db.results_as_hash = true
    @db.type_translation = true

    @db
  end

  def self.reset
    DBConnection.open(DB_PATH)
  end

  def self.instance
    reset if @db.nil?

    @db
  end

  def self.execute(*args)
    print_query(*args)
    instance.execute(*args)
  end

# execute2 returns array of rows if no block specified
  def self.execute2(*args)
    print_query(*args)
    instance.execute2(*args)
  end

  def self.last_insert_row_id
    instance.last_insert_row_id
  end

  private

  def self.print_query(query, *interpolation_args)
    return unless PRINT_QUERIES

    puts '--------------------'
    puts query
    unless interpolation_args.empty?
      puts "interpolate: #{interpolation_args.inspect}"
    end
    puts '--------------------'
  end
end
