require 'pg'

def clear_test_bookmarks_table
  con = PG.connect dbname: 'bookmark_manager_test', user: 'lukeusher'
  con.exec 'TRUNCATE TABLE bookmarks;'
end

def populate_test_bookmarks_table
  con = PG.connect dbname: 'bookmark_manager_test', user: 'lukeusher'
  Bookmark.create(url: 'http://www.reddit.com')
  Bookmark.create(url: 'http://www.twitch.tv')
  Bookmark.create(url: 'http://www.soundcloud.com')
end
