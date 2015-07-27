class Api::V1::InvoicesController < ApplicationController

  def show
    respond_with Invoice.find_by(id: params[:id])
  end

  def random
    respond_with Invoice.all.sample
  end

  def search
    respond_with Invoice.find_by(params.first.first => params.first.last)
  end

  def search_all
    respond_with Invoice.where(params.first.first => params.first.last)
  end
end
