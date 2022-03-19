#!/bin/bash
mkdir ~/ftch
cp ftch/* ~/ftch
echo alias ftch="cd ~/ftch && bash main.sh && cd" >> ~/.zshrc
echo alias ftch="cd ~/ftch && bash main.sh && cd" >> ~/.bashrc