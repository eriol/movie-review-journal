TEX_FILE := movie-review-journal.tex

.PHONY: build

build:
	arara $(TEX_FILE)

# Needed to print front and back.
print-rotated:
	pdftk movie-review-journal.pdf cat 3south output output.pdf
