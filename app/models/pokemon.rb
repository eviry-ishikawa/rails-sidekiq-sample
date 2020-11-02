class Pokemon < ApplicationRecord
    def show_jobs
      Sidekiq::Workers.new.each do |process_id, thread_id, job|
        puts "#{process_id}, #{thread_id}, #{job}"
      end
    end
end
