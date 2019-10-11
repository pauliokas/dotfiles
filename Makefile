DIR := $(patsubst %/,%,$(dir $(realpath $(firstword $(MAKEFILE_LIST)))))
FILES := \
	zshrc zshenv zprofile zsh.d \
	xinitrc Xresources \
	tmux.conf \
	gitconfig gitignore_global \
	config/bat \
	config/bspwm \
	config/dunst \
	config/kitty \
	config/nvim \
	config/polybar \
	config/ranger \
	config/redshift \
	config/rofi \
	config/sxhkd \
	config/compton.conf \
	cache/wal \
	profile \

SOURCES := $(addprefix $(DIR)/,$(FILES))
TARGETS := $(addprefix $(HOME)/.,$(FILES))

.PHONY: all make_targets update_submodules

all: update_submodules make_targets
	@printf 'Building bat cache... '
	@bat cache --build >/dev/null
	@printf 'OK\n'

make_targets: $(TARGETS)

update_submodules:
	@printf 'Updating submodules... '
	@git submodule update --init --recursive >/dev/null
	@git submodule update --recursive --remote >/dev/null
	@printf 'OK\n'

$(HOME)/.%: $(DIR)/%
	@[ -L "$@" ] && [ "$(shell readlink $@)" != "$<" ] && echo "Link exists, but with a wrong target: $@" || true
	@[ -e "$@" ] && [ ! -L "$@" ] && echo "File exists, but is not a link: $@" || true
	@[ ! -e "$@" ] && ln -s "$<" "$@" && echo "File linked: $@" || true
