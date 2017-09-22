feature 'Adding tags' do
  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://makersacademy.com/'  #1st box to fill in url
    fill_in 'title', with: 'Makers Academy' #2nd box to fill in title
    fill_in 'tags', with: 'education' #3rd box to fill in tag name

    click_button 'Create link'  #actually creating the link with the above
    link = Link.first #assigning instance of Link to variable
    expect(link.tags.map(&:name)).to include('education') #link.tags to form an array of tags(instance of tag class), the creating a new array of tag.names(tag names) and that array to include 'education'
  end

  scenario 'I can add multiple tags to a link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.bbc.co.uk/news'  #1st box to fill in url
    fill_in 'title', with: 'BBC' #2nd box to fill in title
    fill_in 'tags', with: 'education news sports'

    click_button 'Create link'  #actually creating the link with the above
    link = Link.first #assigning instance of Link to variable
    expect(link.tags.map(&:name)).to include('education', 'news', 'sports') #link.tags to form an array of tags(instance of tag class), the creating a new array of tag.names(tag names) and that array to include 'education'
  end
end

# the above is not really happnening here as this is the feature test
# the unit test would define how the inner workings of the above actually runs
# via connectino of controller to the models etc
