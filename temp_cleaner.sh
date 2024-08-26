#!/bin/bash

TEMP_DIR="./temp"

if [ -d "$TEMP_DIR" ]; then
	rm "$TEMP_DIR"/*
	echo "Pasta temp/ limpa em $(date)"
else
	echo "Pasta temp/ não localizada"
fi
