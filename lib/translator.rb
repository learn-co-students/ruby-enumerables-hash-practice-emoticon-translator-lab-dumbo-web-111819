require 'yaml'

def load_library(library)
hash = {"get_emoticon": {}}
YAML.load_library('library.yml')
end
end
def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end

def load_library(emoticons)
  output = {:get_meaning => YAML.load_file(emoticons), :get_emoticon => {}}
end