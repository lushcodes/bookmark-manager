require 'pg'

class Bookmark

def self.create(url:)
  if ENV['RACK_ENV'] == 'test'
    con = PG.connect :dbname => 'bookmark_manager_test', :user => 'lukeusher'
  else
    con = PG.connect :dbname => 'bookmark_manager', :user => 'lukeusher'
  end
  con.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
end




  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'lukeusher'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'lukeusher'
    end
    url_list = con.exec 'SELECT (url) FROM bookmarks;'
    array = []
    url_list.each do |row|
      array << row['url']
    end
    array
  rescue PG::Error => e
    puts e.message
  ensure
    url_list.clear if url_list
    con.close if con
  end
end
