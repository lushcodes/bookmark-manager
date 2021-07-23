require 'bookmark'

describe Bookmark do

  before(:each) do
    # populate_test_bookmarks_table
  end

  describe '.all' do

    it 'it returns all bookmarks' do

      con = PG.connect dbname: 'bookmark_manager_test', user: 'lukeusher'
      bookmark = Bookmark.create(url: 'http://www.reddit.com', title: 'Reddit')
      Bookmark.create(url: 'http://www.twitch.tv', title: 'Twitch')
      Bookmark.create(url: 'http://www.soundcloud.com', title: 'Soundcloud')
    
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq('Reddit')
      expect(bookmarks.first.url).to eq('http://www.reddit.com')
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.example.org', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id )
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq ('http://www.example.org')
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(url: 'http://www.example.org', title: 'Test Bookmark')
      
      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the bookmark with the given data' do
      bookmark = Bookmark.create(title: 'Example', url: 'http://www.example.org')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.example.com', title: 'Example 2')
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Example 2'
      expect(updated_bookmark.url).to eq 'http://www.example.com'
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(title: 'Example', url: 'http://www.example.org')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Example'
      expect(result.url).to eq 'http://www.example.org'
    end
  end
end
