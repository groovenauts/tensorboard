.PHONY: all build


CONSOLE_FULLPATH = /www/works/magellan-maneuvers/magellan-console
HTML_PATH = /app/views/blocks/vz_projectors/projector.html.erb

all: build copyto

build:
	bazel build tensorboard/plugins/projector/vz_projector:blocks

copyto:
	cp ./bazel-bin/tensorboard/plugins/projector/vz_projector/blocks.html ${CONSOLE_FULLPATH}${HTML_PATH}
	chmod 644 ${CONSOLE_FULLPATH}${HTML_PATH}
