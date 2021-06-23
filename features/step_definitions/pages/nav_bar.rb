require 'capybara'

class NavBar
  include Capybara::DSL
  def wrapper
    within '.site-header--content' do
      yield
    end
    self
  end
  def click_link_products
    wrapper do
      click_link 'Spend & Save'
    end
    self
  end
end
