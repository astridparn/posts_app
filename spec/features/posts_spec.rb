require 'rails_helper'

feature 'Posts', js: true do
  scenario 'view' do
    visit '/'
    expect(page).to have_content('Posts')
  end
end