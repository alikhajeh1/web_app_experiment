#!/bin/bash
source /home/jonathan/.bashrc
source /home/jonathan/.bash_profile

bundle exec script/delayed_job -n 8 start > log/run_worker &
