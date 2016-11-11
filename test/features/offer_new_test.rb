require "test_helper"

class OfferNewTest < Capybara::Rails::TestCase
  test "can make an offer" do
    Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_and_login

    click_on('Offer', match: :first)
    assert_equal('Offer - BookTradingClub', page.title)

    fill_in 'search', with: 'Emma'
    click_on 'Search'

    click_on('Emma')

    assert_equal('Make Offer - BookTradingClub', page.title)
    click_on('Make Offer')

    assert_equal('Offer - BookTradingClub', page.title)
    page.must_have_content('Emma, has been offered')
  end

  test "errors are displayed" do
    account = create_account_and_login
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    Want.create(book: book, account: account)

    click_on('Offer', match: :first)
    assert_equal('Offer - BookTradingClub', page.title)

    fill_in 'search', with: 'Emma'
    click_on 'Search'

    click_on('Emma')

    assert_equal('Make Offer - BookTradingClub', page.title)
    click_on('Make Offer')

    page.must_have_content('error prevented the form from being saved')
    page.must_have_content('Already want the book')
  end
end
