class CharacterCatalog < MarvelWorld

  #characters(nil, "162, 30090")
  def characters(limit=nil, comic_ids=nil)
    op = self.options
    op[:query][:limit] = limit if limit
    op[:query][:comics] = comic_ids if comic_ids
    self.class.get("/characters", op)
  end

  def total_characters_number
    #only one character is enough to know total characters because api is returning total number of characters
    res = self.characters(1)
    res.parsed_response['data']['total']
  end

  def character_thumbnail_url(character_id)
    res = self.class.get("/characters/#{character_id}", self.options)
    thumbnail = res.parsed_response['data']['results'].first['thumbnail'] rescue {}
    "#{thumbnail['path']}.#{thumbnail['extension']}"
  end

  def character_names(limit=nil, comic_ids=nil)
    res = self.characters(limit, comic_ids)
    res.parsed_response['data']['results'].collect{|c| c['name']}
  end

  def character(character_id)
    self.class.get("/characters/#{character_id}", self.options)
  end
end