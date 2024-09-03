#!/bin/bash -l
bin/rails db:drop
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
exec "$@"
