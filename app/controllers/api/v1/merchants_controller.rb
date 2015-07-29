class Api::V1::MerchantsController < ApplicationController

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def random
    respond_with Merchant.all.sample
  end

  def search
    respond_with Merchant.find_by(params.first.first => params.first.last)
  end

  def search_all
    respond_with Merchant.where(params.first.first => params.first.last)
  end

  def most_revenue
    respond_with Merchant.most_revenue params[:quantity].to_i
  end

  def most_items
    respond_with Merchant.most_items params[:quantity].to_i
  end

  def revenue
    respond_with Merchant.revenue_for_date params[:date]
  end

  def items
    respond_with Merchant.find_by(id: params[:id]).items
  end

  def merchant_revenue
    if params[:date]
      respond_with Merchant.find_by(id: params[:id]).revenue_for_date params[:date]
    else
      respond_with Merchant.find_by(id: params[:id]).total_revenue
    end
  end

  def favorite_customer
    respond_with Merchant.find_by(id: params[:id]).favorite_customer
  end

  def pending
    respond_with Merchant.find_by(id: params[:id]).customers_with_pending_invoices
  end

  def invoices
    respond_with Merchant.find_by(id: params[:id]).invoices
  end

  def index
    respond_with Merchant.all
  end
end
