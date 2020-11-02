class PokemonAddWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  require 'csv'

  def perform(csv_path)
    CSV.foreach((csv_path), headers: true) do |pokemon|
      10.times do |i|
        Pokemon.create(
          species_id: pokemon[2],
          name: pokemon[1],
          height: pokemon[3],
          weight: i
        )
      end
    end
  end

    def show_jobs
      Sidekiq::Workers.new.each do |process_id, thread_id, job|
        puts "#{process_id}, #{thread_id}, #{job}"
      end
    end
    
    def self.cancelled?
      Sidekiq.redis {|c| c.exists("cancelled-#{jid}") } # Use c.exists? on Redis >= 4.2.0
    end
    
    def self.cancel!(jid)
      Sidekiq.redis {|c| c.setex("cancelled-#{jid}", 86400, 1) }
    end
end
