database_name = ARGV[0]
raise 'No database specified' unless database_name

def setup_database(db_name)
  sql_file_path = File.join __dir__, 'sqlite_sql', "#{db_name}.sql"
  db_file_path = File.join __dir__, 'sqlite_db', "#{db_name}.db"

  begin

    puts "WARNING: Following action will reset database to preconfigured SQL file"
    print "\nPress c to continue, or any other key to exit: "
    choice = $stdin.gets.chomp

    if choice == 'c'

      File.delete(db_file_path) if File.file?(db_file_path)
      system "dropdb #{db_name}"
      system "createdb #{db_name}"
      system "sqlite3 #{db_file_path} < #{sql_file_path}"
    else
      exit(0)
    end
    # use more specific exception than general exception
  rescue Exception => e
    puts e.message
  end
end

setup_database(database_name)
