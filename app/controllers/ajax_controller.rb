# frozen_string_literal: true

class AjaxController < ApplicationController
  before_action :parse_params, only: :result

  def input; end

  def result
    @result ||= string.split.sort_by(&:size).reverse.join(' ')
  end

  private

  attr_reader :string

  def parse_params
    @string = params[:string]
    @result = 'Вы ввели пустую строку.' if string && string.empty?
  end
end
