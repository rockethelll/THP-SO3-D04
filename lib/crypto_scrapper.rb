# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

Page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))

def get_crypto_name(link)
  crypto_name_array = []

  name_crypto = link.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol"]/div').map do |i|
    crypto_name_array << i.text
  end
  puts 'Le tableau de noms des cryptos monnaies est la.'
  crypto_name_array.flatten
end

def get_crypto_value(link)
  crypto_value_array = []

  link.xpath('//*[@class="sc-8bda0120-0 dskdZn"]').map do |i|
    crypto_value_array << i.text
  end
  puts 'Le tableau des valeurs est récupéré.'
  crypto_value_array.flatten
end

def combine_array(name, value)
  final_array = []
  full_array = name.zip(value)
  full_array.each do |k|
    final_array << [k].to_h
  end
  final_array
end

def perform(link)
  name = get_crypto_name(link)
  value = get_crypto_value(link)
  combine_array(name, value)
end

# perform(Page)
