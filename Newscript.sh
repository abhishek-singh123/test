
##############
# List all remote merged branches
##############
MERGED_BRANCHES_IN_MASTER=`git branch -r --merged origin/master | grep -v -E '(\*|master$|develop$)' | cut -f2- -d '/' | tr '\n' ';'` && export BRANCHES_IN_MASTER && git branch -r --merged origin/develop | grep -v -E '(\*|master$|develop$)' | cut -f2- -d '/' | xargs -L1 bash -c 'if [ $(grep -o "$0" <<< "$BRANCHES_IN_MASTER" | wc -l) -gt 0 ] ; then printf "\e[0;32m $0 \e[0m\n"; else printf "\e[0;31m $0 is merged into DEVELOP but not MASTER \e[0m\n"; fi';
