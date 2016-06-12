require 'rails_helper'

feature "user signs in" do
  scenario "user sees their links" do
    user = create(:user)
    user.links << create_list(:link, 3)
    sign_in(user)

    visit "/"

    expect(page).to have_content(user.email)
    expect(page).to have_content("All Links")
    user.links.each do |link|
      expect(page).to have_link(link.title, href: link.url)
    end
  end
end
