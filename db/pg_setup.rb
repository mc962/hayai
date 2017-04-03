database_name = ARGV[0]
raise 'No database specified' unless database_name

def setup_database(db_name)
  sql_file = File.join __dir__, 'pg_sql', "#{db_name}.sql"

  begin

    puts "WARNING: Following action will reset database to preconfigured SQL file"
    print "\nPress c to continue, or any other key to exit: "
    choice = $stdin.gets.chomp

    if choice == 'c'

      system "dropdb #{db_name}"
      system "createdb #{db_name}"
      system "psql dragons < #{sql_file}"
    else
      puts 'exiting...'
    end
    # use more specific exception than general exception
  rescue Exception => e
    puts e.message
  end
end
setup_database(database_name)
