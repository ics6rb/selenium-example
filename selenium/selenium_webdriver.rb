#!env ruby
# frozen_string_literal: true

require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.navigate.to 'http://localhost:3000'

form = driver.find_element :tag_name, 'form'

string_input = form.find_element name: :string
string_input.send_keys '1 22 333'

form_submit = form.find_element name: :commit
form_submit.click

result = driver.find_element id: 'result'

raise 'Поле результата содержит некорректные данные' unless result.text == '333 22 1'

driver.quit
