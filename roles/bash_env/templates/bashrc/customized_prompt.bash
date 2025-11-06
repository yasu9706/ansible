# customized prompt
# ezprompt,  https://ezprompt.net/
function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "\$?: $RETVAL"
}
PROMPT_COMMAND+='nonzero_return;'

function jobs_count() {
    JOBS_COUNT=$(jobs -l | wc -l)
	if [ $JOBS_COUNT -ne 0 ] ; then
        echo " jobs:$JOBS_COUNT "
    else
        echo ""
    fi
}


# get current branch in git repo
# NOTE: git must be installed
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

# change color for username and hostname if logged in via ssh

function show_ssh_client() {
    echo " $SSH_CLIENT " | cut -d' ' -f2 | sed -E -e 's/(.+)/via \1 /'
}


# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}"
PS1+="\[\e[01;32m\]\u@\h\[\e[m\]"
PS1+=":\[\e[01;34m\]\w\[\e[m\]"
PS1+=" \[\e[30;47m\]\`show_ssh_client\`\[\e[m\]"
PS1+=" \[\e[41m\]\`parse_git_branch\`\[\e[m\]"
#PS1+=" \[\e[45m\]\`nonzero_return\`\[\e[m\]"
PS1+=" \[\e[30;103m\]\`jobs_count\`\[\e[m\]"
PS1+=""
PS1+="\n\$ "
export PS1


