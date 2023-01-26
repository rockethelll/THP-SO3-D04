# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

Page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))

# Récupération du nom des mairies dans un array
def get_townhall_name(link)
  list = []
  link.xpath('//a[@class="lientxt"]').map do |i|
    list << i.text
  end
  puts ''
  puts '-- Liste des noms mairies : OK'
  puts ''
  list
end

# Récupération de la portion de lien figurant dans le href des noms de mairies
def townhall_url(link)
  list = []
  link.xpath('//a[@class="lientxt"]/@href').map do |i|
    list << i.text
  end
  puts '-- Récupération des liens des mairies : OK'
  puts ''
  list
end

# Création des liens puis récupération des adresses mails des mairies sous forme d'un array.
def get_townhall_email(townhall_url)
  final_url = []
  townhall_url.each do |i|
    final_url << "https://www.annuaire-des-mairies.com/#{i}"
  end
  puts '-- Liens des mairies reconstitués : OK'
  puts ''
  puts '-- Veuillez patienter le temps du chargement ... '

  list_mails = []
  final_url.each do |i|
    list_mails << Nokogiri::HTML(URI.open(i)).xpath('//td[2][contains(text(),"@")]').text
  end
  puts '-- Récupération des adresses mails des mairies : OK'
  puts ''
  list_mails
end

# Assemblage des arrays (noms des mairies, adresses mails)
# puis conversion en hash et ajout dans un array
def combine_all(name, email)
  final_array = []
  full_array = name.zip(email)
  full_array.each do |k|
    final_array << [k].to_h
  end
  final_array
end

def perform(link)
  name = get_townhall_name(link)
  email = get_townhall_email(townhall_url(link))
  townhall_url(link)
  result = combine_all(name, email)
  puts ''
  puts '-- Génération de votre document terminée !!!'
  puts 'Voulez-vous voir le document ? (O / N)'
  choice = gets.chomp.upcase.to_s

  if choice == 'O'
    puts result
  elsif
    choice == 'N'
    return false
  else
    puts 'Vous devez taper O ou N'
  end
end

#perform(Page)
