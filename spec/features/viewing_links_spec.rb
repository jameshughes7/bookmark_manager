feature 'Viewing links' do
    before(:each) do
      #need the following links in the database every time we run rspec our test database is wipped due to database_cleaner
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'I can filter links by tag' do
    visit 'tags/bubbles' #specific page we navigate to output filter by bubbles(will proabably change dynamically as we filter by other tags)

    expect(page.status_code).to eq 200
    within 'ul#links' do
      # expect(page).to have_content('Makers Academy')
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Google.com')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end
  end
end
