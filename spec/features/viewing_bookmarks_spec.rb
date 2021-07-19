feature 'Viewing Bookmarks' do
  scenario 'is able to view a list of bookmarks' do
    visit('/')
    click_button 'View Bookmarks'
    expect(page).to have_content 'http://www.reddit.com'
    expect(page).to have_content 'https://www.twitch.tv'
    expect(page).to have_content 'https://soundcloud.com'
  end
end
