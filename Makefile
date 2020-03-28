DIR := $(patsubst %/,%,$(dir $(realpath $(firstword $(MAKEFILE_LIST)))))
FILES := \
	zshrc zshenv zsh.d \
	xinitrc Xresources \
	tmux.conf \
	gitconfig gitignore_global \
	xprofile \
	config/bat \
	config/bspwm \
	config/fontconfig \
	config/kitty \
	config/nvim \
	config/picom \
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

.PHONY: all make_targets update_submodules

all: update_submodules make_targets
	@$(DIR)/post_setup.sh

make_targets: $(TARGETS)

update_submodules:
	@printf 'Updating submodules... '
	@git submodule update --init --recursive >/dev/null
	@git submodule update --recursive --remote >/dev/null
	@printf 'OK\n'

$(HOME)/.%: $(DIR)/%
	@[ -L "$@" ] && [ "$(shell readlink $@)" != "$<" ] && echo "Link exists, but with a wrong target: $@" || true
	@[ -e "$@" ] && [ ! -L "$@" ] && echo "File exists, but is not a link: $@" || true
	@[ ! -e "$@" ] && mkdir -p $(dir $@) && ln -s "$<" "$@" && echo "File linked: $@" || true
