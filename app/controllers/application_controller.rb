class ApplicationController < ActionController::Base
  before_action :choose_locale
  before_action :set_languages

  def set_languages
    @languages = Language.all
  end

  def choose_locale
    I18n.locale = cookies[:locale] || 'en'
    @language = cookies[:language] || "English"
  end
end
