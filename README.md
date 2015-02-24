#Oscar Ballot CLI

##Objectives:
- Creates database with two tables: Categories and Nominees
- Scrapes data from IMDB Oscars page (http://www.imdb.com/awards-central/oscars)
- Populates database with awards data
- Generates CLI Ballot to collect user's picks

##CLI Ballot accepts five commands: 
- SHOW: displays single category or all categories
- VOTE: asks user to select category, displays nominees, asks for pick, saves pick, asks to proceed to next category (if no, then reverts to beginning of command loop)
- PRINT: saves ballot to text file
- HELP: displays help menu (list of valid commands)
- EXIT: exits program