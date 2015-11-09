all:
#	@echo "INFOPATH=/usr/local/texlive/2014/texmf-dist/doc/info:$INFOPATH; export INFOPATH"
#	@echo "MANPATH=/usr/local/texlive/2014/texmf-dist/doc/man:$MANPATH; export MANPATH"
#	@echo "PATH=/usr/local/texlive/2014/bin/x86_64-linux/:$PATH; export PATH"
	pdfcsplain dp
	okular dp.pdf

osnova:
	grep '\\chap\|\\sec' uvod.tex

