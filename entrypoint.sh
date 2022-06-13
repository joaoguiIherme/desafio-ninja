#!/bin/bash

rails db:setup
rails db:migrate
rails server -b '0.0.0.0' -P /dev/null
