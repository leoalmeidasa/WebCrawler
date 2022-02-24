class QuotesController < ApplicationController
  before_action :authenticate_request

  def index
    @quotes = Quote.order('author ASC')
    render json: @quotes, root: 'quotes', adapter: :json
  end
end
