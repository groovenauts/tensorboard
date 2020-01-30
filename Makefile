.PHONY: all build chmod_html replace_favicon copyto


CONSOLE_FULLPATH ?= /www/works/magellan-maneuvers/magellan-console
HTML_PATH ?= /app/views/blocks/gcp_service_accounts/projector.html.erb

ORIGIN_HTML_PATH = ./bazel-bin/tensorboard/plugins/projector/vz_projector/blocks.html

all: build chmod_html replace_favicon copyto

build:
	bazel build tensorboard/plugins/projector/vz_projector:blocks

chmod_html:
	chmod 644 ${ORIGIN_HTML_PATH}

replace_favicon:
	cp ${ORIGIN_HTML_PATH} ${ORIGIN_HTML_PATH}.tmp
	sed -e 's/favicon_blocks2\.ico/<%= path_to_image\("favicon_blocks2\.ico"\) %>/g' ${ORIGIN_HTML_PATH}.tmp > ${ORIGIN_HTML_PATH}

copyto:
	cp ./bazel-bin/tensorboard/plugins/projector/vz_projector/blocks.html ${CONSOLE_FULLPATH}${HTML_PATH}
