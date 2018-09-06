class AddLanguageCodeToLanguages < ActiveRecord::Migration[5.2]
  def change
    add_column :languages, :language_code, :string
  end
end
