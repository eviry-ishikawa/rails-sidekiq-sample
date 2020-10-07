class PokemonAddWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  require 'csv'

  def perform(csv_path)
    CSV.foreach((csv_path), headers: true) do |pokemon|
      Pokemon.create(
        species_id: pokemon[2],
        name: pokemon[1],
        height: pokemon[3],
        weight: pokemon[4]
      )
    end
  end
end
