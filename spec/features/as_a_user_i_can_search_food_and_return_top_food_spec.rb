require 'rails_helper'

feature 'as a user' do
  scenario 'i can fill in a search form and return results' do
    visit root_path

    fill_in 'q', with: 'sweet potatoes'
    click_on 'Search'

    expect(current_path).to eq(foods_path)
    expect(page).to have_content('531 sweet potatoes results')
    expect(page).to have_selector('li', 10)

    within(first('.food')) do
      expect(page).to have_content("NDB Number: 45094945")
      expect(page).to have_content("Name: ONE POTATO TWO POTATO, PLAIN JAYNES, SWEET POTATO CHIPS, UPC: 785654000544")
      expect(page).to have_content("Group: Branded Food Products Database")
      expect(page).to have_content("Datasource: LI")
      expect(page).to have_content("Manufacturer: Dieffenbach's Potato Chips")
    end 
  end
end

# And for each of the foods I should see:
# - The food's NDB Number
# - The food's name
# - The food group to which the food belongs
# - The food's data source
# - The food's manufacturer


  # "offset": 0,
  # "group": "Branded Food Products Database",
  # "name": "ONE POTATO TWO POTATO, PLAIN JAYNES, SWEET POTATO CHIPS, UPC: 785654000544",
  # "ndbno": "45094945",
  # "ds": "LI",
  # "manu": "Dieffenbach's Potato Chips"