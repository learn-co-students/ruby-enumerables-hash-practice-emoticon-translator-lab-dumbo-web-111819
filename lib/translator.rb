require "yaml" # require modules here

def load_library(file_path)
  source = YAML.load_file(file_path)
  output = { "get_meaning" => {}, "get_emoticon" => {} }
  source.each { |key, emoticon| output["get_meaning"][emoticon[1]] = key }
  source.each { |key, emoticon| output["get_emoticon"][emoticon[0]] = emoticon[1] }
  output
end

def get_japanese_emoticon(file_path = "./lib/emoticons.yml", emoticon)
  source = load_library(file_path)
  if source["get_emoticon"][emoticon]
    return source["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path = "./lib/emoticons.yml", emoticon)
  source = load_library(file_path)
  if source["get_meaning"][emoticon]
    return source["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

