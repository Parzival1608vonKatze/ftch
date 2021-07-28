#!/bin/bash

# Get Memory usage
get_mem () {
  free --mega | sed -n -E '2s/^[^0-9]*([0-9]+) *([0-9]+).*/'"${space}"'\2 MB/p'
}

#																			(END OF FILE)