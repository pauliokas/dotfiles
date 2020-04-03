DIR := $(patsubst %/,%,$(dir $(realpath $(firstword $(MAKEFILE_LIST)))))
FILES := \
	zshrc zshenv zsh.d \
	Xresources \
	tmux.conf \
	gitconfig gitignore_global \
	xprofile \
	config/bat \
	config/bspwm \
	config/fontconfig \
	config/kitty \
	config/nvim \
	config/picom \
	config/plasma-workspace \
	config/ranger \
	config/redshift \
	config/sxhkd \
	config/systemd \
	config/wal \
	config/yay \
	cache/wal \
	local/bin/1psw \
	local/bin/desktopctrl \
	local/bin/xf86 \
	pam_environment \

SOURCES := $(addprefix $(DIR)/,$(FILES))
TARGETS := $(addprefix $(HOME)/.,$(FILES))

.PHONY: all links update_submodules

all: update_submodules links
	@$(DIR)/post_setup.sh

links: $(TARGETS)

update_submodules:
	@printf 'Updating submodules... '
	@git submodule update --init --recursive >/dev/null
	@git submodule update --recursive --remote >/dev/null
	@printf 'OK\n'

$(HOME)/.%: $(DIR)/%
	@[ -L "$@" ] && [ "$(shell readlink $@)" != "$<" ] && echo "Link exists, but with a wrong target: $@" || true
	@[ -e "$@" ] && [ ! -L "$@" ] && echo "File exists, but is not a link: $@" || true
	@[ ! -e "$@" ] && mkdir -p $(dir $@) && ln -s "$<" "$@" && echo "File linked: $@" || true
