feature 'Viewing Bookmarks' do
  before(:each) do
    populate_test_bookmarks_table
  end

  scenario 'is able to view a list of bookmarks' do
    visit('/')
    click_button 'View Bookmarks'
    expect(page).to have_link 'Reddit'
    expect(page).to have_link 'Twitch'
    expect(page).to have_link'Soundcloud'
  end
end