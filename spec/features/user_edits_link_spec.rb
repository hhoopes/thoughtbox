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

    click_on "Edit"

    fill_in "Title", with: new_link_params[:title]
    fill_in "Link URL", with: new_link_params[:url]
    click_on "Submit"
    expect(page).not_to have_link(link.title, href: link.url)
    expect(page).to have_link(new_link_params[:title], href: new_link_params[:url])
  end

  scenario "they can't change url to invalid url" do
    user = create(:user)
    user.links << create(:link)
    link = user.links.last

    invalid_link_params = {
      url: "invalid link",
      title: "My new favorite site"
    }

    sign_in(user)
    visit '/'

    click_on "Edit"

    fill_in "Title", with: invalid_link_params[:title]
    fill_in "Link URL", with: invalid_link_params[:url]
    click_on "Submit"

    expect(current_path).to eq(edit_link_path(link))
    expect(page).to have_content("Please submit a valid URL")
    expect(page).not_to have_link(invalid_link_params[:title], href: invalid_link_params[:url])
  end
end
