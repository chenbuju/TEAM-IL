class HomeController < ApplicationController
  def index
    require 'uri'
    require 'net/http'
    require 'openssl'

    @url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{ENV.fetch('CRYPTO')}&start=1&limit=500"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
    @my_coins = ["BTC", "XRP", "ADA", "XLM", "STEEM"]
  end

  def about
    
  end

  def lookup
    require 'uri'
    require 'net/http'
    require 'openssl'

    @url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{ENV.fetch('CRYPTO')}&start=1&limit=500"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_coins = JSON.parse(@response)
     
    @symbol = params[:sym]

    if @symbol
      @symbol = @symbol.upcase

      if @symbol == ''
        @symbol = 'Please provide a currency'
      end
    end
  end
end
