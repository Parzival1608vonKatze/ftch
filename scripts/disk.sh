#!/bin/bash

# get used storage
storage() {
    storageused=$(df -h / | grep "/" | awk '{print $3}')
    storageavail=$(df -h / | grep "/" | awk '{print $2}')
}

#																			(END OF FILE)