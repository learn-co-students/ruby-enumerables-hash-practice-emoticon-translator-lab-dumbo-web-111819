require "yaml"# require modules here

def load_library(file_path)
  library = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticon|
    result["get_meaning"][emoticon[1]] = meaning
    result["get_emoticon"][emoticon[0]] = emoticon[1]
  end
  result
end

def get_japanese_emoticon(file_path_name, eng_emo)
  library = load_library(file_path_name)
  if library["get_emoticon"].include?(eng_emo) 
    library["get_emoticon"][eng_emo]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path_name, j_emo)
  library = load_library(file_path_name)
  if library["get_meaning"].include?(j_emo) 
    library["get_meaning"][j_emo]
  else
    "Sorry, that emoticon was not found"
  end# code goes here
end