#!/bin/bash
hugo --theme=hugo-texify2
git add .
git commit -m "@"
git push -u origin main
