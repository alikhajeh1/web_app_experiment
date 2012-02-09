web: bundle exec rails server thin -p 80 > log_server
worker: bundle exec script/delayed_job -n 8 start > log_worker
