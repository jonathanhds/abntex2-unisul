.PHONY: all clean

# Definição de variáveis
SOURCE      = tcc
GHOSTSCRIPT = gs


all:
	@echo "Compilando arquivos..."
	latexmk -r $(SOURCE).latexmk -use-make $(SOURCE).tex
	@echo "Comprimindo o arquivo pdf..."
	mkdir -p dist
	@$(GHOSTSCRIPT) -q -dNOPAUSE -dBATCH -dSAFER \
	    -sDEVICE=pdfwrite \
	    -dEmbedAllFonts=true \
	    -dSubsetFonts=true \
	    -sOutputFile=dist/$(SOURCE).pdf \
	    tmp/$(SOURCE).pdf
	#mv tmp/$(SOURCE).pdf dist/$(SOURCE).pdf
	@echo "Terminado."

clean:
	@echo "Limpando arquivos temporarios..."
	latexmk -C -r $(SOURCE).latexmk
	rm -rf dist tmp
	@echo "Terminado."