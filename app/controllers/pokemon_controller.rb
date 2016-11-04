class PokemonController < ApplicationController

  def new
    @pokemon = Pokemon.new
  end

  def create
    redirect_to root_path
  end

  def capture
    current_trainer.pokemon<<(Pokemon.find_by(id: params[:id]))
    redirect_to root_path
  end

  def damage
    pokemon = Pokemon.find_by(id: params[:id])
    new_health = pokemon.health - 10
    if new_health <= 0
      pokemon.destroy
    else
      pokemon.update_attribute(:health, pokemon.health - 10)
    end
    redirect_to trainer_path(params[:trainer_id])
  end

end
