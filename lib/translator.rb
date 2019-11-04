# require modules here
require "yaml"


def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  
  hash = {
    get_meaning: {},            # japanese emoticons
    get_emoticon: {}
  }
  
  emoticons.each do |key, value|
    hash[:get_meaning][value[1]] = key
    hash[:get_emoticon][value[0]] = value[1]
  end
  hash
end


def get_japanese_emoticon(file_path,west_emoji)
  hash = load_library(file_path)
  jp_emoji =  hash[:get_emoticon][west_emoji]
  
  return jp_emoji if !!jp_emoji 
  "Sorry, that emoticon was not found"  
end


def get_english_meaning(file_path,jp_emoji)

  hash = load_library(file_path)
  meaning =  hash[:get_meaning][jp_emoji]
 
  return meaning if !!meaning
  "Sorry, that emoticon was not found"  
end