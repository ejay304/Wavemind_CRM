#!/bin/sh

RAILS_ENV=production rake db:migrate

RAILs_ENV=production rake assets:precompile

service apache2 restart

