.PHONY: examples

CC = xelatex
EXAMPLES_DIR = examples
AP_DIR = examples/ap
RESUME_DIR = examples/resume
CV_DIR = examples/cv
AP_SRCS = $(shell find $(AP_DIR) -name '*.tex')
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume ap, $x.pdf)

ap.pdf: $(EXAMPLES_DIR)/ap.tex $(AP_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
