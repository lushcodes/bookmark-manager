require 'pg'

class Bookmark 

  def self.all
    begin

      con = PG.connect :dbname => 'BookmarkManager', :user => 'lukeusher'
      
      url_list = con.exec "SELECT (url) FROM bookmarks;"
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
end