class SalesController < ApplicationController

  get '/sales' do
    @sales = Sale.all
    erb :'/sales/database'
  end

  get '/sales/new' do
    erb :'/sales/new'
  end

  post '/sales' do
    #raise params.inspect
    @sale = Sale.new(business_name: params[:business_name], location: params[:location], sale: params[:sale], website: params[:website])
    if @sale.save
      redirect '/sales'
    else
      erb :'/sales/new'
    end
end


end
