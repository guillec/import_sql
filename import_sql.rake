desc "Import .sql file to your app"
task :import_sql => :environment do

    filepath = File.dirname __FILE__
    sql = File.open(filepath + "/file_name.sql").read
    sql.split(');').each do |sql_statement|
      #clean_statement = sql_statement.gsub(';',',')
      begin
        ActiveRecord::Base.connection.execute(sql_statement)
      rescue
        # Error insrting data
      end
    end

end
