class Api::V1::WordsController < ApplicationController
  before_action :validate_word, only: %i[new]

  def new
    Word.create!(word: params[:word])
  end

  def locate
    p '', ''
    JSON.parse(params[:l_array]).each {|l| p l}
    p '', ''
    result = Word.fetch(params[:l_one], params[:l_two], params[:l_three], params[:l_four], params[:l_five])
    render json: { count: result.size, result: result.map { |r| r.word } }
  end

  private

  def validate_word
    return unless params[:word].count == 5

    head :unauthorized
  end
end
