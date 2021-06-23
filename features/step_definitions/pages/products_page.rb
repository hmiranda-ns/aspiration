require 'capybara'

class ProductsPage
  include Capybara::DSL

  def card_original_wrapper
    within '.plan-original' do
      yield
    end
    self
  end
  def card_plus_wrapper
    within '.plan-a-plus' do
      yield
    end
    self
  end

  def modal
    within '.modal-open' do
      yield
    end
    self
  end

  def click_button_get_original_card
    card_original_wrapper do
      click_button 'Get Aspiration'
    end
    self
  end

  def click_button_get_plus_card
    card_plus_wrapper do
      click_button 'Get Aspiration Plus'
    end
    self
  end

  def has_yearly_price?(price)
    within find('.option', text: 'Yearly') do
      return has_text?("$#{price} paid once yearly")
    end
    self
  end

  def has_monthly_price?(price)
    within find('.option', text: 'Monthly') do
      return has_text?("$#{price} paid monthly")
    end
    self
  end

end
