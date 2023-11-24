# frozen_string_literal: true

module Api
  module V1
    class MonthTestsController < ApplicationController
      def parse_month
        month = params[:month]
        result = Month2Number.parse(month)

        MonthTest.create(month: month, returned_value: result)

        render json: { month_number: result }, status: :ok
      end

      def index
        render json: { data: MonthTest.all }, status: :ok
      end
    end
  end
end
