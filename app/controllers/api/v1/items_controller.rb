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
    if params[:merchant_id]
      respond_with Item.where(merchant_id: params[:merchant_id])
    elsif params[:invoice_id]
      respond_with Invoice.find_by(id: params[:invoice_id]).items
    end
  end
end

