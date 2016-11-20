# require modules here
require "byebug"

def load_library(filepath)
  require "yaml"
  emoticons = {"get_meaning" => {}, "get_emoticon" => {}}
  original = YAML.load_file(filepath)
  #debugger
  original.each do |desc, symbols|
    emoticons["get_meaning"][symbols[1]] = desc
    emoticons["get_emoticon"][symbols[0]] = symbols[1]
  end
  #debugger
  emoticons
end

def get_japanese_emoticon(filepath, emoticon)
  emoticon_hash = load_library(filepath)

  emoticon_hash.each do |desc, translation|
    if desc == "get_emoticon"
      translation.each do |west, east|
        return east if west == emoticon
      end
    end
  end

  return "Sorry, that emoticon was not found"
end

def get_english_meaning(filepath,emoticon)
  emoticon_hash = load_library(filepath)

  emoticon_hash.each do |desc, translation|
    if desc == "get_meaning"
      translation.each do |east, west|
        return west if east == emoticon
      end
    end
  end

  return "Sorry, that emoticon was not found"
end
