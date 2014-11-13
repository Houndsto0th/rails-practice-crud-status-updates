require "rails_helper"


feature "Status" do
  scenario "user creates a new status" do
    visit root_path
    click_on "New Status"
    fill_in "Status", with: "Testing Status"
    fill_in "User", with: "Testy McUserson"
    click_on "Create Statusupdate"
    expect(page).to have_content("Status created")
  end

  scenario "user creates a blank status" do
    visit root_path
    click_on "New Status"
    click_on "Create Statusupdate"
    expect(page).to have_content("can't be blank")
  end

  scenario "user deletes a status" do
    Statusupdate.create!(
      status: "Testing",
      user: "Testy McTester"
    )

    visit root_path
    expect(page).to have_content("Testy McTester")
    click_on "Edit"
    click_on "Delete"
    expect(page).to have_content("Status deleted")
  end

  scenario "user edits a status" do
    Statusupdate.create!(
      status: "Testing",
      user: "Testy McTester"
    )

    visit root_path
    expect(page).to have_content("Testy McTester")
    click_on "Edit"
    fill_in "Status", with: "oh man tests"
    click_on "Update Statusupdate"
    expect(page).to have_content("Status updated")

  end

  scenario "user edits a status by making a field blank" do
    Statusupdate.create!(
      status: "Testing",
      user: "Testy McTester"
    )

    visit root_path
    expect(page).to have_content("Testy McTester")
    click_on "Edit"
    fill_in "Status", with: ""
    click_on "Update Statusupdate"
    expect(page).to have_content("can't be blank")

  end


end
