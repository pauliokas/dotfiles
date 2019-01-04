BASE_DIR := $(shell pwd)

DOTBOT_DIR := .dotbot
DOTBOT_BIN := bin/dotbot

CONFIG := .install.conf.yaml

.PHONY: install update-dotbot upgrade

install: update-dotbot
	"${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASE_DIR}" -c "${CONFIG}"

update-dotbot:
	git submodule update --init --recursive "${DOTBOT_DIR}"

upgrade:
	git submodule update --init --remote