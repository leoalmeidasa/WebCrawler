module Api
  module V1
    class QuotesController < ApplicationController
      before_action :auth_user

      def index
        @quotes = Quote.order('author ASC')
        render json: @quotes, root: 'quotes', adapter: :json
      end
    end
  end
end