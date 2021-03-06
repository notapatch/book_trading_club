# BuildOfferTrade
#  - build a trade object starting with offer and a book
#
class BuildOfferTrade
  attr_accessor :trade, :offer

  def initialize(offer:)
    self.offer = offer
    self.trade = Trade.new
  end

  def build
    if want.present?
      trade.offer = offer
      trade.want = want.first
    end
    self
  end

  private

  def want
    @want ||= Want.untraded.by_book(offer.book)
  end
end
