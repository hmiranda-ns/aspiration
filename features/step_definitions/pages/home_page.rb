require 'capybara'

class HomePage
  include Capybara::DSL
  def wrapper
    within find_by_data_id('header') do
      yield
    end
    self
  end
  def click_link_navbar_products
    wrapper do
      click_link 'Spend & Save'
    end
    self
  end
end
