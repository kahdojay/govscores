class AddCitationsToSuggestions < ActiveRecord::Migration
  def change
    add_column :suggestions, :citations, :text
  end
end
