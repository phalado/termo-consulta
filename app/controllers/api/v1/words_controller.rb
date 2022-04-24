# frozen_string_literal: true

module Api
  module V1
    class WordsController < ApplicationController
      before_action :validate_word, only: %i[new]

      def new
        Word.create!(word: params[:word])
      end

      def locate
        result = Word.fetch(
          search_array, remove_array, params[:l_one], params[:l_two], params[:l_three], params[:l_four], params[:l_five]
        )
        render json: { count: result.size, result: result.map(&:word) }
      end

      private

      def validate_word
        return unless params[:word].count == 5

        head :unauthorized
      end

      def search_array
        params[:l_array].nil? ? [] : JSON.parse(params[:l_array])
      end

      def remove_array
        params[:r_array].nil? ? [] : JSON.parse(params[:r_array])
      end
    end
  end
end
