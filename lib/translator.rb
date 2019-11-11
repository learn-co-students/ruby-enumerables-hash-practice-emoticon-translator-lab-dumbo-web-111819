# require modules here
require "yaml"

def load_library(english_emoticons) #load_library loads the emoticons.yml file, which has the "english emoticons"
  # code goes here
   emo = YAML.load_file(english_emoticons) #extracting the emoticons from the file
  
  new_hash = {             #creating a hash to store the meaning and emoticon symbols
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emo.each do |key,value|
    new_hash['get_emoticon'][value[0]] = emo[key][1]
    new_hash['get_meaning'][value[1]] = key
  end
  new_hash
end

def get_japanese_emoticon(emofile,emo) 
#takes a traditional Western emoticon, e.g., :), and translates it to its Japanese version
#relies on load_library to work

  # code goes here
  result = load_library(emofile)['get_emoticon'][emo]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(emofile,emo)
  # code goes here
  result = load_library(emofile)['get_meaning'][emo]
  result ? result : "Sorry, that emoticon was not found"
end