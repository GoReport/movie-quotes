# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require './environments'

enable :sessions

  class Quote < ActiveRecord::Base
  end

  after { ActiveRecord::Base.connection.close }

  get "/" do
    @quotes = Quote.order("created_at DESC")
    @title = "Welcome."
    erb :"quotes/index"
  end

  get "/quote/create" do
    @title = "Create quote"
    @quote = Quote.new
    erb :"quotes/create"
  end

  post "/quote" do
    @quote = Quote.new(params[:quote])
    if @quote.save
      redirect "quote/#{@quote.id}", :notice => 'Congrats! Love the new quote. (This message will disappear in 4 seconds.)'
    else
      redirect "quote/create", :error => 'Something went wrong. Try again. (This message will disappear in 4 seconds.)'
    end
  end

  get "/quote/:id" do
    @quote = Quote.find(params[:id])
    @title = @quote.film
    erb :"quotes/view"
  end

  get "/quote/:id/edit" do
    @quote = Quote.find(params[:id])
    @title = "Edit Form"
    erb :"quotes/edit"
  end

  put "/quote/:id" do
    @quote = Quote.find(params[:id])
    @quote.update(params[:quote])
    redirect "/quote/#{@quote.id}"
  end

  delete "/quote/:id" do
    @quote = Quote.find(params[:id])
    @quote.destroy
    redirect "/", :error => 'Your quote has been deleted. (This message will disappear in 4 seconds.)'
  end

  helpers do
    include Rack::Utils
    alias_method :h, :escape_html
  end

  helpers do
    def title
      if @title
        "#{@title}"
      else
        "Welcome."
      end
    end
  end
