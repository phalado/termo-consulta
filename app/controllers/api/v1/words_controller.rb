# frozen_string_literal: true

module Api
  module V1
    class WordsController < ApplicationController
      def locate
        result = Word.fetch(
          search_array, remove_array, params[:l_one], params[:l_two], params[:l_three], params[:l_four], params[:l_five]
        )
        render json: { count: result.size, result: result.map(&:word) }, status: :ok
      end

      private

      def search_array
        params[:l_array].nil? ? [] : JSON.parse(params[:l_array])
      end

      def remove_array
        params[:r_array].nil? ? [] : JSON.parse(params[:r_array])
      end
    end
  end
end
