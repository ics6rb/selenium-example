# frozen_string_literal: true

require './page.rb'

class HomePage < Page
  def initialize(base_url, driver)
    super
    @path = '/'
  end

  def open
    super
    @form = driver.find_element :tag_name, 'form'
    self
  end

  def fill_form_with(text)
    input = form.find_element name: :string
    input.send_keys text
    self
  end

  def submit_form
    submit = form.find_element name: :commit
    submit.click
    self
  end

  def result
    result = driver.find_element id: :result
    result.text
  end

  protected

  attr_reader :path

  private

  attr_reader :form
end
