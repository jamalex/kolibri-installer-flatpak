#!/bin/sh

flatpak-builder --user --install --force-clean build-dir org.learningequality.Kolibri.json

# flatpak-builder --repo=repo --force-clean build-dir org.learningequality.Kolibri.json
# flatpak --user remote-add --no-gpg-verify kolibri-repo repo
# flatpak --user install kolibri-repo org.learningequality.Kolibri
