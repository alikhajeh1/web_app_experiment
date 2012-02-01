Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.sleep_delay = 5
Delayed::Worker.max_attempts = 4
Delayed::Worker.max_run_time = 60.minutes
Delayed::Worker.delay_jobs = !Rails.env.test?

# Delayed job requires some attributes to be accessible - make sure they are
Delayed::Worker.backend = :active_record
Delayed::Job.attr_accessible :priority, :payload_object, :handler, :run_at, :failed_at