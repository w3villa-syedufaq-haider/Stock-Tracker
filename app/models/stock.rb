require 'finnhub_ruby'

class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name , :ticker , presence: true
    def self.new_lookup(ticker_symbol)
        FinnhubRuby.configure do |config|
            config.api_key['api_key'] = 'chk5fl1r01qnu4tqvq8gchk5fl1r01qnu4tqvq90'
          end
          
        client = FinnhubRuby::DefaultApi.new
                    
        begin
          new(ticker: ticker_symbol, name: client.company_profile2({symbol: ticker_symbol}).name, last_price: client.quote(ticker_symbol).c)
        rescue => exception
             return nil
        end
    end

    def self.check_db(ticker_symbol)
       where(ticker: ticker_symbol).first
    end
end
