class CharactersController < ApplicationController
  def index
    character_catalog = CharacterCatalog.new
    res = character_catalog.characters
    @characters = res.parsed_response['data']['results']
  end

  def show
    character_catalog = CharacterCatalog.new
    res = character_catalog.character(params[:id])
    @character = res.parsed_response['data']['results'].first
  end

  def home

  end
end
