require_rel '../support/hooks', 'pages'
require 'capybara'
require 'capybara/rspec'

go_to = Hooks.new()
home = HomePage.new()

Given("User goes to Aspiration.com's home page") do
  visit go_to.home
end

When('Clicks on Spend & Save link on navigation bar') do
  home.click_link_navbar_products
end

Then('Can see products and prices page') do
  expect(page).to have_text('Spend & Save Plans')
  expect(page).to have_current_path(go_to.products)
end
