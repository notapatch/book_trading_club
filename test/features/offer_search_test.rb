require "test_helper"

class OfferSearchTest < Capybara::Rails::TestCase
  test "greets visitor with action to perform" do
    create_account_and_login
    Book.create(title: 'Vanity Fair', author: 'William Makepeace Thackeray')
    click_on('Offer', match: :first)

    assert_equal('Offer - BookTradingClub', page.title)
    page.must_have_content('Enter a search and the results appear here')
  end

  test "returns books in the library" do
    create_account_and_login
    Book.create(title: 'Vanity Fair', author: 'William Makepeace Thackeray')
    click_on('Offer', match: :first)

    assert_equal('Offer - BookTradingClub', page.title)
    fill_in 'search', with: 'Tha'
    click_on 'Search'
    page.must_have_content('William Makepeace Thackeray')
  end

  test "if no search term it gives user the appropriate action" do
    create_account_and_login
    Book.create(title: 'Vanity Fair', author: 'William Makepeace Thackeray')
    click_on('Offer', match: :first)

    assert_equal('Offer - BookTradingClub', page.title)
    fill_in 'search', with: ''
    click_on 'Search'
    page.must_have_content('There are no books containing the term(s) "".' \
                           ' Enter another search.')
  end

  test "returns nothing if book not in library" do
    create_account_and_login
    Book.create(title: 'Vanity Fair', author: 'William Makepeace Thackeray')
    click_on('Offer', match: :first)

    assert_equal('Offer - BookTradingClub', page.title)
    fill_in 'search', with: 'Hobbit'
    click_on 'Search'
    page.must_have_content('There are no books containing the term(s) "Hobbit"')
  end
end