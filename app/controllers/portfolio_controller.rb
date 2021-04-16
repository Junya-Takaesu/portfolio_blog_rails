class PortfolioController < ApplicationController
  def index
    @portfolios = Portfolio::List
  end
end