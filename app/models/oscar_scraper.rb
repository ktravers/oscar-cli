class OscarScraper
  attr_accessor :data

  def scrape
    html = open('http://www.imdb.com/awards-central/oscars') 
    data = Nokogiri::HTML(html)

    # get category names
    data.search("div.award").collect do |category|
      cat_name = category.search("h1").text
      Category.create(cat_name)

      # get nominees
      category.search("div.nominees").collect do |nominee|
        nom_name = nominee.search("p strong a").text
        nom_attribute = nominee.search("p a:nth-child(2)").text
        Nominee.create(nom_name, nom_attribute).category = cat_name
        # how to connect category name?
      end
    end
  end

  ###--- HELPER METHODS (FOR REFERENCE ONLY) ---###

  def get_category_names 
    @data.search("div.award h1").collect { |title| title.text }
  end
  #=> ["Best Motion Picture of the Year", "Best Performance by an Actor in a Leading Role"...]

  def get_nominee
    @data.search("div.award p strong a").collect { |nominee| nominee.text }
  end
  #=> ["American Sniper", "Birdman", "Boyhood"...]

  def get_nominee_attribute
    @data.search("div.nominee.alt p a:nth-child(2)").collect { |attribute| attribute.text }
  end
  #=> ["Clint Eastwood", "Richard Linklater"... "Foxcatcher", "American Sniper"...]

end