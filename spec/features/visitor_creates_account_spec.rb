require "rails_helper"

feature "visitor can register as a user" do
  scenario "they are redirected to links" do
    visit '/'

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Please Log In or Sign Up")
    click_on "Sign Up"

    expect(current_path).to eq(signup_path)
    fill_in "Email", with: "heidi@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Submit"

    expect(page).to have_content("Welcome, #{User.last.email}")
    expect(page).to have_content("Add a new link")
  end
end
