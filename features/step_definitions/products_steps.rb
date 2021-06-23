require_rel '../support/hooks', 'pages'
require 'capybara'
require 'capybara/rspec'

go_to = Hooks.new()
home = HomePage.new()
products = ProductsPage.new()

Then('Can see two card products') do
  expect(page).to have_css('.plan-original')
  expect(page).to have_css('.plan-a-plus')
  products.card_original_wrapper do
    expect(page).to have_text("$0")
  end
  products.card_plus_wrapper do
    expect(page).to have_text("$7.99")
  end
end

When('Clicks on Get Aspiration button') do
  products.click_button_get_original_card
end

Then('Sign up modal appears') do
  expect(page).to have_css('.modal-open')
  expect(page).to have_selector('input#join-waitlist-input')
end

When('Clicks on Get Aspiration Plus button') do
  products.click_button_get_plus_card
end

Then('Subscription modal appears') do
  expect(page).to have_css('.modal-open')
  expect(page).to have_text('Choose your Aspiration Plus plan')
  expect(page).to have_css('.option', count: 2)
  expect(page).to have_text('Yearly')
  expect(page).to have_text('Monthly')
end

Then('On Modal, yearly radio option is ${float} paid once yearly') do |float|
  expect(products.has_yearly_price?(float)).to be true
end

Then('On modal, monthly radio option is ${float} paid monthly') do |float|
  expect(products.has_monthly_price?(float)).to be true
end
