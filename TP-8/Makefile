SOURCES=$(shell find . -name "*.Rmd")
TARGET = $(SOURCES:%.Rmd=%.pdf)

%.pdf: %.Rmd
	Rscript -e "rmarkdown::render('$<')"

default: $(TARGET)

clean:
	rm -rf $(TARGET)
