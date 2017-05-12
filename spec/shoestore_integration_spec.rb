require "spec_helper"

describe("the /store/new path", {:type => :feature}) do
  it("creates a new store and verify's it's presence on the '/' path") do
    visit("/")
    click_link("Add a store")
    fill_in("name", :with => "Nike")
    click_button("Create")
    expect(page).to have_content("Nike")
  end
end

describe("the /store/:id", {:type => :feature}) do
  it("goes to a specific stores page") do
    visit("/")
    click_link("Nike")
    expect(page).to have_content("Nike")
  end

  it("adds a shoe to the store") do
    visit("/")
    click_link("Nike")
    fill_in("shoe_brand", :with => "Converse")
    fill_in("shoe_price", :with => "40")
    click_button("Add shoe")
    expect(page).to have_content("Converse")
  end
end

# describe("the phrase parser path", {:type => :feature}) do
#   it("processes the user input and returns correct message if its a palindrome") do
#     visit("/")
#     fill_in("phrase1", :with => "madam")
#     fill_in("phrase2", :with => "anagram")
#     click_button("what am i?")
#     expect(page).to have_content("'madam' is a palindrome")
#   end
# end
