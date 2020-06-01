all: build run

build:
	latexmk -pdf db.tex
run:
	evince db.pdf &
clean:
# 	docker rmi latex_img
	rm -f *.aux *.fdb_latexmk *.fls *.log *.out *.synctex.gz *.toc *.bbl *bcf *.blg *.xml *.snm *.nav
docker:
	docker build -f Dockerfile -t latex_img .
	docker run -it -v ${PWD}:/root/ans:Z --rm --name latex_doc latex_img
docker_test:
	docker build -f Dockerfile -t latex_img .
	docker run -it -v ${PWD}:/root/ans:Z --rm --name latex_doc latex_img bash
