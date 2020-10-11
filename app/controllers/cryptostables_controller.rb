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
    @cryptostable = Cryptostable.new(cryptostable_params)

    respond_to do |format|
      if @cryptostable.save
        format.html { redirect_to @cryptostable, notice: 'Cryptostable was successfully created.' }
        format.json { render :show, status: :created, location: @cryptostable }
      else
        format.html { render :new }
        format.json { render json: @cryptostable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cryptostables/1
  # PATCH/PUT /cryptostables/1.json
  def update
    respond_to do |format|
      if @cryptostable.update(cryptostable_params)
        format.html { redirect_to @cryptostable, notice: 'Cryptostable was successfully updated.' }
        format.json { render :show, status: :ok, location: @cryptostable }
      else
        format.html { render :edit }
        format.json { render json: @cryptostable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cryptostables/1
  # DELETE /cryptostables/1.json
  def destroy
    @cryptostable.destroy
    respond_to do |format|
      format.html { redirect_to cryptostables_url, notice: 'Cryptostable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cryptostable
      @cryptostable = Cryptostable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cryptostable_params
      params.require(:cryptostable).permit(:symbol, :user_id, :cost_per, :amount_owned)
    end

    def correct_user
      @correct = current_user.cryptostables.find_by(id: params[:id])
      redirect_to cryptostables_path, notice: "Not authorized to edit entry" if @correct.nil?
    end
end
