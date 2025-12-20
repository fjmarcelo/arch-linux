RAMA=edicion

pdf:
	/home/felix/arch-linux/ISO.sh
	xelatex 00\ arch-linux.tex -o arch-linux.pdf
	rm -f *.aux *.log *.nav *.out *.snm *.toc
	git add .

push: 
	git push origin ${RAMA}
	git push forgejo ${RAMA}
