class ComicCatalog < MarvelWorld

  def comic(comic_id)
    res = self.class.get("/comics/#{comic_id}", self.options)
  end

end