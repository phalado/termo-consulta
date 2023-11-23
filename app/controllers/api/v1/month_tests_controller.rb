# frozen_string_literal: true

module Api
  module V1
    class MonthTestsController < ApplicationController
      def locate
        month = params[:month]
        result = Month2Number.parse(month)

        MonthTest.create(word: month, returned_value: result)

        render json: { month_number: result }, status: :ok
      end
    end
  end
end
