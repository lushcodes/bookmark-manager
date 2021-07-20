require 'pg'

class Bookmark
  def self.all
    con = if ENV['RACK_ENV'] == 'test'
            # con = PG.connect :dbname => 'BookmarkManager_test', :user => 'lukeusher'
            PG.connect dbname: 'bookmark_manager_test', user: 'elsemeijerink'
          else
            # con = PG.connect :dbname => 'BookmarkManager', :user => 'lukeusher'
            PG.connect dbname: 'bookmark_manager', user: 'elsemeijerink'
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
