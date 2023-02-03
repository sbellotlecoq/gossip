require 'csv'

#Déjà, notre potin aura deux variables d'instance que tu peux d'ores et déjà mettre en attr_reader : le author et le content

class Gossip
	attr_accessor :content, :author # HA HA COQUIN 
	def initialize(author, content)
	  @content = content
	  @author = author
	end

    #Bon, grâce à ce code, si on fait Gossip.new("moi", "coucou !"), on peut créer un premier potin ! C'est un bon début, mais cela ne sauvegarde rien du tout dans notre CSV et du coup, l'information va disparaître quand le programme s'arrêtera de tourner. 
    #Il faudrait donc une méthode save qui enregistre dans la base de donnée l'instance de potin que l'on vient de créer

	def save                                          # https://stackoverflow.com/questions/4822422/output-array-to-csv-in-ruby
		CSV.open('db/gossip.csv','r') do |csv|
			csv.puts author + "," +content
		end
	end

####------------------------------------------------------########
## To a file
## CSV.open("path/to/file.csv", "wb") do |csv|
##    csv << ["row", "of", "CSV", "data"]
##    csv << ["another", "row"]


    # Pour ceci, nous allons utiliser une méthode qui s'appelle self.all, qui va lire chaque ligne du CSV, 
    # puis retourner un array contenant des instances de potins du genre : [potin_1, potin_2, …, potin_n]. 
    # J'insiste sur un point: il s'agit d'un array d'objets de la classe Gossip. Donc si je fais 
    # potin_1.author, je récupère l'auteur du potin_1. Si je fais potin_2.content, je récupère le contenu du potin_2. Et ainsi de suite.
    
    #def self.all
        # 1)création d'un array vide qui s'appelle all_gossips
      
        # 2)chaque ligne de ton CSV.each do |ligne|
          # 2-a) gossip_provisoire = Gossip.new(paramètres de la ligne) - permet de créer un objet gossip
          # 2-b) all_gossips << gossip_provisoire - permet de rajouter le gossip provisoire au array
        # end
        # 3)return all_gossips - on renvoie le résultat
      #end

	def self.all
		all_gossips = [] # 1)création d'un array vide qui s'appelle all_gossips
		CSV.open('db/gossip.csv',"wb").each do |ligne|  #2)chaque ligne de ton CSV.each do |ligne|
		gossip_provisoire = Gossip.new(params.keys[0], params.values[0]) # - permet de créer un objet gossip
        all_gossips << gossip_provisoire  #- permet de rajouter le gossip provisoire au array
		end
		return all_gossips
    end
end