# frozen_string_literal: true

require_relative '../lib/mairie'

describe 'The get_townhall_name(link) method' do
  it 'should return email' do
    expect(get_townhall_name(Page).include?('TAVERNY')).to be true
  end
end

describe 'The townhall_url(link) method' do
  it 'should return email' do
    expect(townhall_url(Page).include?('./95/themericourt.html')).to be true
  end
end

describe 'The get_townhall_email(townhall_url) method' do
  it 'should return email' do
    expect(get_townhall_email(townhall_url(Page)).include?('mairie@ville-taverny.fr')).to be true
  end
end

describe 'The combine_all(name, email) method' do
  it 'should return email' do
    expect(combine_all(get_townhall_name(Page), get_townhall_email(townhall_url(Page))).class).to eq Array
  end
end
