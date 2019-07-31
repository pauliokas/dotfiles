DIR := $(patsubst %/,%,$(dir $(realpath $(firstword $(MAKEFILE_LIST)))))
FILES := \
	.zshrc .zshenv .zprofile .zsh.d \
	.xinitrc .Xresources \
	.tmux.conf \
	.gitconfig .gitignore_global \
	.config/bat \
	.config/bspwm \
	.config/dunst \
	.config/nvim \
	.config/polybar \
	.config/redshift \
	.config/rofi \
	.config/sxhkd \
	.config/compton.conf \
	.cache/wal \
	.profile \

SOURCES := $(addprefix $(DIR)/,$(FILES))
TARGETS := $(addprefix $(HOME)/,$(FILES))

.PHONY: all make_targets update_submodules

all: update_submodules make_targets

make_targets: $(TARGETS)

update_submodules:
	@echo 'Updating submodules...'
	@git submodule update --init --recursive

$(HOME)/%: $(DIR)/%
	@[ -e $@ ] && [ "$(shell readlink $@)" != "$<" ] && echo "File already exists, but is not a link: $@" || true
	@[ ! -e $@ ] && ln -s $< $@ && echo "File linked: $@" || true
