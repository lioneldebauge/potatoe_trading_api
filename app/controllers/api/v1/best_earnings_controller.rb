module Api
  module V1
    class BestEarningsController < ApplicationController
      def show
        render json: { amount: best_earning }
      end

      private

      def best_earning
        BestEarningCalculator.new(min_time: min_time, max_time: max_time).result
      end

      # With more time and if more duplication arise the code below should probably extracted somewhere else
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