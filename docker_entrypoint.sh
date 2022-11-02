#!/bin/bash

set -e

export SPARROW_NETWORK=mainnet

while true; do sleep 100; done 

exec tini sparrow -h
