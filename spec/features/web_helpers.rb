require 'pg'

def clear_test_bookmarks_table
  con = PG.connect dbname: 'bookmark_manager_test', user: 'lukeusher'
  con.exec 'TRUNCATE TABLE bookmarks;'
end

def populate_test_bookmarks_table
  con = PG.connect dbname: 'bookmark_manager_test', user: 'lukeusher'
  Bookmark.create(url: 'http://www.reddit.com', title: 'Reddit')
  Bookmark.create(url: 'http://www.twitch.tv', title: 'Twitch')
  Bookmark.create(url: 'http://www.soundcloud.com', title: 'Soundcloud')
end
