# api.rb

require 'grape'

class API < Grape::API
  prefix 'api'
  version 'v1'
  format :json

  after { ActiveRecord::Base.connection.close }

  get :hello do
    { hello: "world" }
  end

  resource :quotes do
    desc "Return a list of all quotes"
    get do 
      @quotes = Quote.order("created_at DESC")
    end

    desc "Return a random quote"
    get :random do
      ids = Quote.pluck(:id)
      Quote.find(ids.sample)
    end

    desc "Return a single quote"
    params do
      requires :id, type: String, desc: "Quote ID"
    end
    get ":id" do
      @quote = Quote.find(params[:id])
    end

    desc "Create a quote"
    params do
      requires :quote, type: Quote, desc: "Quote to add"
    end
    post do
      @quote = Quote.new(params[:quote])
      if @quote.save
        @quote
      else
        {error:"Your quote could not be saved"}
      end
    end

    desc "Update a quote"
    params do
      requires :id, type: String, desc: "Quote ID"
      requires :quote, type: Quote, desc: "Quote details"
    end   
    put ":id" do
      @quote = Quote.find(params[:id])
      @quote.update(params[:quote])
    end

    desc "Delete a single quote"
    params do
      requires :id, type: String, desc: "Quote ID"
    end
    delete ":id" do
      @quote = Quote.find(params[:id])
      @quote.destroy
    end
  end
end
