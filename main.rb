require 'json'
# A Stock class that receive a symbol and date and has a `price` method that returns the price of the stock on that date.
class Stock
  def initialize(symbol, date)
    @symbol = symbol
    @date = date
  end

  def price(date)
    JSON.parse(File.read("data.jsonc"))[@symbol][date].to_f 
  end
end

# A Portfolio class that has a collection of Stocks and a `profit` method that receives 2 dates and returns the profit of the Portfolio between those dates.
class Portfolio
  def initialize(stocks)
    @stocks = stocks
  end

  def profit(start_date, end_date)
    # get the profit of the portfolio between those dates
    @stocks.map { |stock| stock.price(end_date) - stock.price(start_date) }.reduce(:+)
  end
end

# new portfolio with stocks
portfolio = Portfolio.new([Stock.new("AAPL", "2019-01-01")])
p portfolio.profit("2019-01-01", "2019-01-02")
