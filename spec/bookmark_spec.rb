require 'bookmark'

describe Bookmark do
  it 'should exist' do
  end

  before(:each) do
    populate_test_bookmarks_table
  end

  describe '.all' do
    it 'it returns all bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.reddit.com')
      expect(bookmarks).to include('http://www.twitch.tv')
      expect(bookmarks).to include('http://www.soundcloud.com')
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.example.org')
      expect(Bookmark.all).to include 'http://www.example.org'
    end
  end 
end
