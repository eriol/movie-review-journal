TEX_FILE := movie-review-journal.tex

.PHONY: build

build:
	arara $(TEX_FILE)
