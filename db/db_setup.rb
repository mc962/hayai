database_name = ARGV[0]

def setup_database(db_name)
  dir = File.dirname(__FILE__)
  db_path = File.join(dir, '/', "sqlite_db/#{db_name}.db")
  sql_path = File.join(dir, '/', "sqlite_sql/#{db_name}.sql")

  begin
    system "dropdb #{db_name}"
    system "createdb #{db_name}"
    system "sqlite3 #{db_path} < #{sql_path}"
  rescue
    # later do error checking through ruby instead of letting shell throw error, but for now is fine
  end
end

setup_database(database_name)
