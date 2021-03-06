# require modules here
require 'yaml'
def load_library(file_path = 'lib/emoticons.yml')
  # code goes here
  emoticon_library = YAML.load_file('lib/emoticons.yml')
  result = emoticon_library.each_with_object({}) do |(key, value), final_hash|
    if !final_hash[key]
      final_hash[key] ={
        :english => value[0],
        :japanese => value[1]
      }
    end
    result
  end
end

def get_japanese_emoticon(file_path, e_emoticon)
  # code goes here
  emoticons = load_library(file_path)
  j_meaning = ""
  apology = "Sorry, that emoticon was not found"
  emoticons.each do |emotion, language|
    if language[:english] == e_emoticon
      j_meaning = language[:japanese]
    end
    if j_meaning == ""
      j_meaning = apology
    end
  end
  j_meaning
end

def get_english_meaning(file_path, j_emoticon)
  # code goes here
  emoticons = load_library(file_path)
  eng_meaning = ""
  apology = "Sorry, that emoticon was not found"
  emoticons.each do |emotion, language|
    language.each do |inner_key, emoticon|
      if emoticon == j_emoticon
        eng_meaning = emotion
      end
    end
    if eng_meaning == ""
      eng_meaning = apology
    end
  end
  eng_meaning
end
