# coding: utf-8
require 'readability_export_file'

def print(item)
  header = "--- #{item.article_title} ---"
  footer = '-' * header.length

  puts header
  puts " - article_url: #{item.article_url}"
  puts " - date_added: #{item.date_added}"
  puts " - archive: #{item.archive}"
  puts " - date_archived: #{item.date_archived}"
  puts " - favorite: #{item.favorite}"
  puts " - date_favorited: #{item.date_favorited}"
  puts " - article_excerpt: #{item.article_excerpt}"
  puts footer, ''
end


path = 'data/test.json'
item_list = ReadabilityExportFile.parse(path)

item_list.each { |item|
  print(item)
}
