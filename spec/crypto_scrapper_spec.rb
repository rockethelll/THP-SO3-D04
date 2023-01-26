# frozen_string_literal: true

require_relative '../lib/crypto_scrapper'

describe 'The get_crypto_name method' do
  it 'should return the name of crypto' do
    expect(get_crypto_name(Page).include?('BTC')).to be true
    expect(get_crypto_name(Page).include?('ETH')).to be true
    expect(get_crypto_name(Page).include?('ATOM')).to be true
  end
end

describe 'The get_crypto_value method' do
  it 'should return the value of crypto' do
    expect(get_crypto_value(Page).class).to eq Array
  end
end

describe 'The combine_array method' do
  it 'should return an array with crypto name and value' do
    expect(combine_array(get_crypto_name(Page), get_crypto_value(Page)).class).to eq Array
  end
end

