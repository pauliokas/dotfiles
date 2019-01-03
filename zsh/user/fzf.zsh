export FZF_DEFAULT_OPTS='--preview "\
    ([[ $(file --mime {}) =~ inode/directory ]] && echo Directory) || \
    ([[ $(file --mime {}) =~ binary ]] && echo Binary) || \
    ((filename=$(basename -- {}) && \
    ext=${filename##*.} && \
    bat --language=${ext} --color=always {}) || \
    cat {}) 2>/dev/null"'
