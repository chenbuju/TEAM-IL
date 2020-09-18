class CryptostablesController < ApplicationController
  before_action :set_cryptostable, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy, :show]

  # GET /cryptostables
  # GET /cryptostables.json
  def index
    @cryptostables = Cryptostable.all

    require 'uri'
    require 'net/http'
    require 'openssl'

    @url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{ENV.fetch('CRYPTO')}&start=1&limit=500"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_cryptos = JSON.parse(@response)
    @profit_loss = 0
  end

  # GET /cryptostables/1
  # GET /cryptostables/1.json
  def show
  end

  # GET /cryptostables/new
  def new
    @cryptostable = Cryptostable.new
  end

  # GET /cryptostables/1/edit
  def edit
  end

  # POST /cryptostables
  # POST /cryptostables.json
  def create
    @cryptostable = Cryptostable.new(cryptostab