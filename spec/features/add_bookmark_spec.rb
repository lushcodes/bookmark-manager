feature 'Add a bookmark' do
  scenario '/new page has url submit form' do
    visit('/')
    click_button 'Add Bookmark'
    expect(page).to have_selector("input")
  end

  scenario 'allows user to add bookmark' do
    visit('/')
    click_button 'Add Bookmark'
    fill_in('url', with: 'http://example.org')
    click_button('Add')
    
    expect(page).to have_content 'http://example.org'
  end
end