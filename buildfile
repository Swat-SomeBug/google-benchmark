./: {src/ -build/ -upstream/} doc{UPSTREAM_README.md} legal{LICENSE} manifest

# Don't install tests.
#
tests/: install = false
