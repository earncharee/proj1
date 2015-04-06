class PokemonsController < ApplicationController

	def capture 
		iden = Pokemon.find(params[:id])
		iden.trainer_id = current_trainer.id
		iden.save
		redirect_to root_path
	end

	def damage
		iden = Pokemon.find(params[:id])
		iden.health = iden.health - 10
		iden.save
		if iden.health <= 0
			iden.delete
		end
		redirect_to trainer_path(iden.trainer_id)
	end

	def new
		@pokemon = Pokemon.new
	end

	def create
  	@pokemon = Pokemon.new
  	@pokemon.name = pokemon_params[:name]
  	if @pokemon.valid?
  		@pokemon.level = 1
  		@pokemon.health = 100
  		@pokemon.trainer_id = current_trainer.id
  		@pokemon.save
  		redirect_to trainer_path(current_trainer.id)
  	else
  		flash[:error] = @pokemon.errors.full_messages.to_sentence
  		render "new"
  	end
  end

	private
	def pokemon_params
		params.require(:pokemon).permit(:name)
	end

end
