# require modules here
filename='./lib/emoticons.yml'


def load_library(filename)
  #load_file and save to result
  require "yaml"
  result=YAML.load_file(filename)
  
  
  #create hash with two keys :get_meaning and :get_emoticon
  name={}
  name[:get_meaning]={}
  name[:get_emoticon]={}

  #create two hash and an array and populate them
  hash_1={}
  hash_2={}
  keys=[]
  result.each do |k,v|
    hash_1[v[1]]={}
    hash_2[v[0]]={}
    keys << k
  end
  #populate the values of the :get_meaning and :get_emoticon keys
  name[:get_meaning]=hash_1
  name[:get_emoticon]=hash_2
  
  # the emoticon keys inside the 'get_meaning' hash point to their meanings
  i=0
  name[:get_meaning].map do |k|
    name[:get_meaning][k[0]]=keys[i]
  i+=1
  end
  
  
  keys_1=name[:get_meaning].keys
  # the emoticon keys inside the 'get_emoticon' hash point to their Japanese equivalent
  j=0
  name[:get_emoticon].map do |k|
    name[:get_emoticon][k[0]]=keys_1[j]
  j+=1
  end
  name
end

def get_japanese_emoticon(filename,emoticon)
  new_array=[]
  result=load_library(filename)
  result.map do |k,v|
    if k == :get_emoticon
      v.map do |k1,v1|
        if k1 == emoticon
          new_array << v1
        end
      end
    end
  end
  if new_array.length==1
    new_array[0]
  else
    "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(filename,emoticon)
    new_array=[]
  result=load_library(filename)
  result.map do |k,v|
    if k == :get_meaning
      v.map do |k1,v1|
        if k1 == emoticon
          new_array << v1
        end
      end
    end
  end
  if new_array.length==1
    new_array[0]
  else
    "Sorry, that emoticon was not found"
  end
  # code goes here
end