class CryptostablesController < ApplicationController
  before_action :set_cryptostable, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_a