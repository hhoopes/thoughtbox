require 'rails_helper'

feature "user edits a link", js: true do
  scenario "they see their edits" do
    user = create(:user)
    user.links << create(:link)
    link = user.links.last

    new_link_params = {
      url: "http://example.com/new",
      title: "My new favorite site"
    }

    sign_in(user)
    visit '/'

    within("div#link-#{link.id}") do
      click_on "Edit"
    end
    fill_in "Title", with: new_link_params[:title]
    fill_in "Link URL", with: new_link_params[:url]
    click_on "Submit"
    expect(page).not_to have_link(link.title, href: link.url)
  end
end
