#!/usr/bin/env bash

docker-compose --file=docker-compose.yml up --scale node_participant_chrome=3 --scale node_participant_firefox=3
