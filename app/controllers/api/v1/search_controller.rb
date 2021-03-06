# frozen_string_literal: true

module Api
  module V1
    class SearchController < ApplicationController
      before_action :auth_user

      def index
        unless Quote.tags_exists?(params[:search_tag]).any?

          scrape_quotes = CrawlerService.new(params[:search_tag]).perform

          scrape_quotes.each do |scrape|
            Quote.find_or_create_by!(quote: scrape[:quote], author: scrape[:author], author_about: scrape[:author_about],
                                     tags: scrape[:tags])
          end

        end

        @quotes = Quote.search_tag(params[:search_tag])
        render json: @quotes, root: 'quotes', adapter: :json
      end
    end
  end
end
