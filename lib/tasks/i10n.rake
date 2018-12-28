require 'rubygems'
require 'yaml'
require 'json'


namespace :i10n do
  desc "Translate all Locales"
  task locales: :environment do

    def translate(string, translate_locale, translator)
      puts "Translating #{string} to #{translate_locale}"
     # binding.pry
      translator.translate string.to_s, from: 'en', to: translate_locale
    end
    def process(hash, translate_locale, translator)
      hash.inject({}) do |h, pair|
        key, value = pair
        h[key] = value.kind_of?(Hash) ? process(value, translate_locale, translator) : translate(value, translate_locale, translator)
        h
      end
    end

    from_language = "en".to_sym

    directory = "config/locales/"
    hash = YAML.load_file("#{directory}#{from_language}.yml")[from_language.to_s]

    languages = Language.all.reject{|a| a.language_code == "en"}

    translator = Yandex::Translator.new(ENV['YANDEX'])
    languages.each do |language|

      to_language = language.language_code.to_sym
      translate_locale = language.language_code
      File.open("#{directory}#{to_language}.yml", 'w') do |out|
        YAML.dump({to_language.to_s => process(hash, translate_locale, translator)}, out)
      end
    end
  end
  desc "Translate all Devise Locales"
  task devise: :environment do

    def translate(string, translate_locale, translator)

      snippets = string.scan(/%{([^{}]+)}/).flatten
      snippets.each_with_index do |snip, index|
        string = string.gsub("%{#{snip}}", "holderXX-#{index}")
      end
      puts "Translating #{string} to #{translate_locale}"
     # binding.pry
      translated = translator.translate string.to_s, from: 'en', to: translate_locale

      snippets.each_with_index do |snip, index|
        translated = translated.gsub( "holderXX-#{index}", "%{#{snip}}")
      end

      translated

    end
    def process(hash, translate_locale, translator)
      hash.inject({}) do |h, pair|
        key, value = pair
        h[key] = value.kind_of?(Hash) ? process(value, translate_locale, translator) : translate(value, translate_locale, translator)
        h
      end
    end

    from_language = "en".to_sym

    directory = "config/locales/devise."
    hash = YAML.load_file("#{directory}#{from_language}.yml")[from_language.to_s]

    languages = Language.all.reject{|a| a.language_code == "en"}

    translator = Yandex::Translator.new(ENV['YANDEX'])
    languages.each do |language|

      to_language = language.language_code.to_sym
      translate_locale = language.language_code
      File.open("#{directory}#{to_language}.yml", 'w') do |out|
        YAML.dump({to_language.to_s => process(hash, translate_locale, translator)}, out)
      end
    end
  end

end