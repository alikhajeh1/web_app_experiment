#!/bin/bash
source /home/jonathan/.bashrc
source /home/jonathan/.bash_profile

bundle exec thin start --port 80 > log_server &