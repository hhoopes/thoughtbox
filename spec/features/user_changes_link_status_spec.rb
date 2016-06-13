require 'rails_helper'

feature 'user changes a link status', js: true do
  let(:user) { create(:user) }
  let(:link) { create(:link) }

  scenario 'after reloading status hasn\'t changed' do
    user.links << link
    sign_in(user)

    visit '/'
    click_on "(Mark as read)"
    expect(page).not_to have_content("Mark as read")
    expect(page).to have_content("Mark as unread")

    visit '/'

    expect(page).not_to have_content("Mark as read")
    expect(page).to have_content("Mark as unread")
  end

  scenario 'changes it back' do
    user.links << link
    sign_in(user)

    visit '/'
    click_on "(Mark as read)"
    click_on "(Mark as unread)"
    expect(page).not_to have_content("Mark as unread")
    expect(page).to have_content("Mark as read")
  end
end
