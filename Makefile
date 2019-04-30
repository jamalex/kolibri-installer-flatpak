
build:
	flatpak-builder --user --install --force-clean build-dir org.learningequality.Kolibri.json

start:
	flatpak run org.learningequality.Kolibri

stop:
	flatpak kill `flatpak ps | grep org\.learningequality\.Kolibri | cut -f1`