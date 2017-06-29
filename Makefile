.PHONY: all generate verify
export PYTHONDONTWRITEBYTECODE = 1

default: all

all: .venv generate verify

.venv:
	virtualenv .venv
	.venv/bin/pip install pytest
	.venv/bin/pip install pytest-xdist
	.venv/bin/pip install docker

generate: .certs
	make -C generate setup build generate clean_exited

verify: .venv
	.venv/bin/pytest -n 4

clean:
	rm -r ./.venv
	rm -r ./.certs
