#Ce fameux chef d'orchestre : le controller est avant tout une suite de méthodes qui sont appelées par le routeur. 
#Chaque méthode va contenir des appels au model Gossip et se finira avec un retour vers une view qui affiche quelquechose.


#Il aura 3 méthodes : 
#une qui gère la création d'un potin, 
#une qui gère l'affichage de la liste des potins, 
#et une qui permet de détruire un potin. 

#Une fois l'action effectuée (via le model), 
#la méthode devra renvoyer vers la view.



require_relative "view"
require_relative "gossip"
require 'csv'

class Controller
	def initialize
		@view = View.new
	end

    #Tu vas créer la méthode create_gossip. Cette méthode va donc créer un nouvel objet gossip, donc instancer la classe Gossip (le model) avec Gossip.new.
    #C'est tout pour le moment. On verra comment pointer vers la view plus tard 😉
    #Maintenant que le model est capable de créer un gossip et de le sauvegarder, retouche la méthode create_gossip dans le controller en y ajoutant les lignes suivantes :

	def create_gossip #1 - CREATION DU POTIN
		params = @view.create_gossip
		gossip = Gossip.new(params.keys[0], params.values[0])
		#pour le moment, le contenu de ce gossip est inscrit "en dur" dans le code. L'utilisateur ne peut pas le changer.
		gossip.save
  	end

	def index_gossip
		@view.index_gossip(Gossip.all)
	end

    def delete_gossip
		Gossip.modify_csv(@view.reject_gossip(Gossip.all))
	end

#Demander au model un array qui contient tous les potins que l'on a en base
#Demander à la view d’exécuter sa propre méthode index_gossips qui affichera tous les potins

end
