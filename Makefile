.PHONY: test
test:
	pip install -r requirements.txt
	NOSE_COVER_PACKAGE=limbo nosetests -s --nologcapture --with-coverage

.PHONY: clean
clean:
	rm -rf build dist limbo.egg-info

.PHONY: run
run: install
	bin/limbo

.PHONY: repl
repl: install
	bin/limbo -t

.PHONY: install
install:
	python setup.py install
	make clean

.PHONY: publish
publish:
	pandoc -s -w rst README.md -o README.rs
	python setup.py sdist upload
	rm README.rs

.PHONY: flake8
flake8:
	flake8 limbo test
