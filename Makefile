.SILENT: install clean

install:
	if [[ "$(realpath ${HOME}/.config/nvim)" = "${PWD}" ]]; then  \
	    echo "Nothing to do";                                     \
	elif [[ -e "${HOME}/.config/nvim" ]]; then                    \
	    echo "ERROR: Path is not symlinked to this directory!";   \
	    exit 1;                                                   \
	else                                                          \
	    ln -s "${PWD}" "${HOME}/.config/nvim";                    \
	    echo "Installed to \"${HOME}/.config/nvim\"";             \
	fi;

clean:
	if [[ "$(realpath ${HOME}/.config/nvim)" = "${PWD}" ]]; then  \
	    rm -rf "${HOME}/.config/nvim";                            \
	    echo "Removed from \"${HOME}/.config/nvim\"";             \
	elif [[ -e "${HOME}/.config/nvim" ]]; then                    \
	    echo "ERROR: Path is not symlinked to this directory!";   \
	    exit 1;                                                   \
	else                                                          \
	    echo "Nothing to do";                                     \
	fi;
