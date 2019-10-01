#!/bin/bash

build:
	flatpak-builder --user --install --force-clean build-dir org.learningequality.Kolibri.json

run:
	flatpak-builder --run build-dir org.learningequality.Kolibri.json run_kolibri.sh

start:
	flatpak run org.learningequality.Kolibri

stop:
	./stop.sh