class Api::V1::WordsController < ApplicationController
  before_action :validate_word, only: %i[new]

  def new
    Word.create!(word: params[:word])
  end

  private

  def validate_word
    return unless params[:word].count == 5

    head :unauthorized
  end
end
