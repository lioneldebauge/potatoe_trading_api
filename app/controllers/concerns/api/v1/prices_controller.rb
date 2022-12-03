module Api
  module V1
    class PricesController < ApplicationController
      # With more time I would have added pagination and throttling
      # According to the business context I would also consider authorization and caching.
      def index
        prices = Price.where(time: min_time..max_time).order(time: :desc)
        render json: prices
      end
    
      private
    
      def query_params
        params.permit(:min_time, :max_time)
      end
    
      def min_time
        Time.at(min_time_param.to_i)
      end
    
      def max_time
        Time.at(max_time_param.to_i)
      end

      def min_time_param
        query_params.compact_blank.fetch(:min_time)
      end

      def max_time_param
        query_params.compact_blank.fetch(:max_time)
      end

      def valid_params?
        min_time_param !~ /\D/ && max_time_param !~ /\D/
      end
    end
  end
end
