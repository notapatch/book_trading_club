# ContactPage
#  - page object to act as abstraction away from Capybara
#
class ContactPage
  include Capybara::DSL

  def fill(full_name: 'Bo',
           address_line_1: '8 Station Road',
           address_line_2: 'Wickham',
           county: 'Kent',
           postcode: 'BR4 0PU')
    fill_in 'Full name', with: full_name
    fill_in 'Address line 1', with: address_line_1
    fill_in 'Address line 2', with: address_line_2
    fill_in 'County', with: county
    fill_in 'Postcode', with: postcode
    self
  end

  def save
    click_on('Save and Continue')
    self
  end
end
