# SPDX-FileCopyrightText: 2022 Daniele Tricoli <eriol@mornie.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

DOCUMENT_NAME := movie-review-journal
TEX_FILE := ${DOCUMENT_NAME}.tex
PDF_FILE := ${DOCUMENT_NAME}.pdf
ROTATED_PAGE := 180-rotated-review-page.pdf

.PHONY: all build print clean

all: build print clean

build:
	arara $(TEX_FILE)

# Ready to print front and back.
print: build
	pdftk ${PDF_FILE} cat 2south output ${ROTATED_PAGE}
	mv ${PDF_FILE} ${PDF_FILE}~
	pdftk ${PDF_FILE}~ ${ROTATED_PAGE} cat output ${PDF_FILE}

clean:
	rm -f ${PDF_FILE}~ ${ROTATED_PAGE}
	rm -rf svg-inkscape
