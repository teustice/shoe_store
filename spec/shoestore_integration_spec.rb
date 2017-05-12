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

  it("edits a store name") do
    visit("/")
    click_link("Nike")
    click_link("Edit store")
    fill_in("name", :with => "The new Nike")
    click_button("Edit")
    expect(page).to have_content("The new Nike")
  end

  it("deletes a store") do
    visit("/")
    click_link("Nike")
    click_link("Edit store")
    click_button("Delete")
    expect(page).to have_no_content("Nike")
  end
end

describe("the /store/shoe path", {:type => :feature}) do
  it("goes to a shoe page") do
    visit("/")
    click_link("Nike")
    fill_in("shoe_brand", :with => "Converse")
    fill_in("shoe_price", :with => "40")
    click_button("Add shoe")
    click_link("Converse")
    expect(page).to have_content("Converse")
  end

  it("edits a shoe") do
    visit("/")
    click_link("Nike")
    fill_in("shoe_brand", :with => "Converse")
    fill_in("shoe_price", :with => "40")
    click_button("Add shoe")
    click_link("Converse")
    fill_in("shoe_brand", :with => "The new Converse")
    fill_in("shoe_price", :with => "45")
    click_button("Update")
    expect(page).to have_content("The new Converse")
  end

  it("deletes a shoe") do
    visit("/")
    click_link("Nike")
    fill_in("shoe_brand", :with => "Converse")
    fill_in("shoe_price", :with => "40")
    click_button("Add shoe")
    click_link("Converse")
    click_button("Delete")
    expect(page).to have_no_content("Converse")
  end
end
