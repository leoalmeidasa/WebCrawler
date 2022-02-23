class QuotesController < ApplicationController
  before_action :authorize_request, except: :index

  def index
    @quotes = Quote.order('author ASC')
    render json: @quotes, root: 'quotes', adapter: :json
  end
end
