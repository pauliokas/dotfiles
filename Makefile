DIR := $(patsubst %/,%,$(dir $(realpath $(firstword $(MAKEFILE_LIST)))))

ifeq (Darwin,$(shell uname))
	FILES=$(shell cat $(DIR)/links.osx.txt)
else ifeq (Linux,$(shell uname))
	FILES=$(shell cat $(DIR)/links.linux.txt)
endif

SOURCES := $(addprefix $(DIR)/,$(FILES))
TARGETS := $(addprefix $(HOME)/.,$(FILES))

.PHONY: all links update_submodules
.FORCE:

all: update_submodules links
	@$(DIR)/post_setup.sh

links: $(TARGETS)

update_submodules:
	@printf 'Updating submodules... '
	@git submodule update --init --recursive >/dev/null
	@git submodule update --recursive --remote >/dev/null
	@printf 'OK\n'

$(HOME)/.%: $(DIR)/% .FORCE
	@[ -L "$@" ] && [ "$(shell readlink $@)" != "$<" ] && echo "Link exists, but with a wrong target: $@" || true
	@[ -e "$@" ] && [ ! -L "$@" ] && echo "File exists, but is not a link: $@" || true
	@[ ! -e "$@" ] && mkdir -p $(dir $@) && ln -s "$<" "$@" && echo "File linked: $@" || true
