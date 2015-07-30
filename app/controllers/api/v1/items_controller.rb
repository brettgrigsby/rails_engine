class Api::V1::ItemsController < ApplicationController

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def random
    respond_with Item.all.sample
  end

  def search
    respond_with Item.find_by(params.first.first => params.first.last)
  end

  def search_all
    respond_with Item.where(params.first.first => params.first.last)
  end

  def index
    respond_with Item.all
  end

  def invoice_items
    respond_with Item.find_by(id: params[:item_id]).invoice_items
  end

  def merchant
    respond_with Item.find_by(id: params[:item_id]).merchant
  end

  def most_revenue
    respond_with Item.most_revenue(params[:quantity])
  end

  def most_items
    respond_with Item.most_items(params[:quantity])
  end

  def best_day
    respond_with Item.find_by(id: params[:id]).best_day
  end
end

