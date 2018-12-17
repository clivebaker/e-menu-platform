# frozen_string_literal: true

class TranslateJob < ApplicationJob
  queue_as :default

  def perform(menu)
    translator = Yandex::Translator.new(ENV['YANDEX'])
    Language.all.each do |language|
      if menu.node_type == 'item'
        translation = translator.translate menu.description, from: 'en', to: language.language_code
        menu.attributes = { description: translation, locale: language.locale }
        puts "Translated :: #{language.name} :: description => #{translation}"
      end
      translation = translator.translate menu.name, from: 'en', to: language.language_code
      menu.attributes = { name: translation, locale: language.locale }
      puts "Translated :: #{language.name} ::  name => #{translation}"
    end

    menu.save
  end
end
