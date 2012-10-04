#!/bin/bash

#  selector is a simple command line utility for selection of strings
#  with a dynamic pattern-matching.
#
#  Copyright (c) 2011, 2012 Francois Fleuret
#  Written by Francois Fleuret <francois@fleuret.org>
#
#  This file is part of selector.
#
#  selector is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 3 as
#  published by the Free Software Foundation.
#
#  selector is distributed in the hope that it will be useful, but
#  WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with selector.  If not, see <http://www.gnu.org/licenses/>.

#  This script installs two key-bindings:
#
#  Alt-r for selector-based command history
#
#  Alt-c for selector-based directoy history
#
#  Note that you have to call it with "source bash-selector.sh"
#  otherwise the key-bindings will not be effective in your current
#  bash

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "This script must be called with 'source $(basename $0)'" >&2
    exit 1
fi

######################################################################
# Selector-based command history
######################################################################

function selector-history () {
    selector --bash -j -y -u -c 7,4,0,3 -q <(history)
}

######################################################################
# Selector-based directory history
######################################################################

# The file where we will keep track of the directories

export SELECTOR_CD_HISTORY

[[ "${SELECTOR_CD_HISTORY}" ]] || SELECTOR_CD_HISTORY=${HOME}/.selector-cd-history

# The function to use in place of the standard "cd"

function selector-cd () {
    if [[ -z "$1" ]]; then
        cd
    else
        cd "$@"
    fi

    if [[ -f ${SELECTOR_CD_HISTORY} ]]; then
        TMP=$(mktemp /tmp/selector-cd.XXXXXX)
        tail -999 < ${SELECTOR_CD_HISTORY} > ${TMP}
        cat ${TMP} > ${SELECTOR_CD_HISTORY}
        rm -f ${TMP}
    fi

    echo $PWD | sed -e "s!^${HOME}!~!" >> ${SELECTOR_CD_HISTORY}
}

function selector-cd-search () {
    if [[ -f ${SELECTOR_CD_HISTORY} ]]; then
        PATH_TEMP=$(mktemp /tmp/selector-cd-path.XXXXXX)
        selector -j -y -u -t "cd" -l 1000 -d -i -c 7,2,0,3 -o ${PATH_TEMP} -q ${SELECTOR_CD_HISTORY}
        NEW_PATH="$(cat ${PATH_TEMP} | sed -e 's!~!'${HOME}'!')"
        if [[ -s "${NEW_PATH}" ]]; then
            selector-cd "$(cat ${PATH_TEMP} | sed -e 's!^~!'${HOME}'!')"
        fi
        \rm ${PATH_TEMP}
    else
        echo "No cd history file ${SELECTOR_CD_HISTORY}." >&2
    fi
}

alias cd=selector-cd

######################################################################
# The key-bindings themselves
######################################################################

    # M-t appends the selected history line and the end of the current
    # one bind '"\C-[t":"\C-a\C-kselector-history\C-m\C-a\C-y\C-e"'

if [[ "$1" ]]; then

    while [[ "$1" ]]; do

        case "$1" in

            --hist)
                # M-r puts the selected history line in place of the current one
                bind '"\C-[r":"\C-a\C-kselector-history\C-m"'
                ;;

            --cd)
                # M-c provides a dynamic list of directories to cd into
                bind '"\C-[c":"\C-a\C-kselector-cd-search\C-m"'
                ;;

            *)
                echo "Unknown argument $1" >&2
                ;;
        esac

        shift

    done

else

    echo "source bash-selector.sh <--hist|--cd> [...]"
    echo
    echo "Defines bash functions, and installs key-bindings and aliases to use selector"
    echo "for history search with M-r and/or intelligent cd history with M-c."

fi
