MELANGE=melange

all: build

build: inotify.dylan
	dylan-compiler -build inotify

inotify.dylan: inotify.intr
	$(MELANGE) -Tc-ffi inotify.intr inotify.dylan

clean:
	rm -f inotify.dylan
