class HomeController < ApplicationController
  def index
    require 'uri'
    require 'net/http'
    require 'openssl'

    @url = "https://pro-api.c