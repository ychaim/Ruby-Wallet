#!/usr/bin/env ruby
# WalletApp.rb

require 'rubygems'
require 'sinatra'
require 'haml'
require 'classes/WalletController.rb'
require 'otapi'


module WalletModule

  class WalletApp < Sinatra::Base

    set :public => "public"

    attr_accessor :menu, :wallet_controller

    def initialize
      super
      
      @menu = [
        {"name" => "Start", "link" => "/"},
        {"name" => "Transfers", "link" => "/transfers"},
        {"name" => "Cheques", "link" => "/cheques"},
        {"name" => "Cash", "link" => "/cash"}
      ]
        
      @wallet_controller = WalletController.new
    end

    get '/' do
      haml :index
    end

    get '/transfers' do
      haml :transfers
    end

    get '/cheques' do
      haml :cheques
    end

    post '/cheques' do
      @wallet_controller.write_cheque(params)
      redirect "/cheques"
    end

    get '/cash' do
      haml :cash
    end

  end

  WalletApp.run!

end
