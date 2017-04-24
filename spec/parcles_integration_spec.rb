require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the parcels path', {:type => :feature}) do
  it('processes the user entry and returns the cost to ship the parcel') do
    visit('/')
    fill_in('length', :with => '5')
    fill_in('width', :with => '5')
    fill_in('height', :with => '4')
    fill_in('weight', :with => '10')
    select('Ground', :from => 'delivery')
    click_button('Reveal')
    expect(page).to have_content("$1.80")
  end
end
