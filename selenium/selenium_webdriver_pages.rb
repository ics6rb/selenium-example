#!env ruby
# frozen_string_literal: true

require 'selenium-webdriver'
require './pages/home.rb'

BASE_URL = 'http://localhost:3000'

driver = Selenium::WebDriver.for :chrome

home_page = HomePage.new BASE_URL, driver

home_page
  .open
  .fill_form_with('1 22 333')
  .submit_form

raise 'Поле результата содержит некорректные данные' unless home_page.result == '333 22 1'

driver.quit
