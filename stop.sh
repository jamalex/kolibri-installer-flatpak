for pid in $(flatpak ps | grep org\.learningequality\.Kolibri | cut -f1)
do
	flatpak kill $pid
done