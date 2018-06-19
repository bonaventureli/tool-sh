#!/bin/bash -e
DIR=$PWD
CORES=$(getconf _NPROCESSORS_ONLN)
debian_stable_git="2.9.5"
#debian_stable_git="2.1.4"

build_git(){
echo "-----------------------------"
        echo "scripts/git: git is too old: [`LC_ALL=C ${git_bin} --version | awk '{print $3}'`], building and installing: [${debian_stable_git}] to /usr/local/"

wget --quiet -c --directory-prefix="${DIR}/ignore/" https://www.kernel.org/pub/software/scm/git/git-${debian_stable_git}.tar.gz
        if [ -f "${DIR}/ignore/git-${debian_stable_git}.tar.gz" ] ; then
                cd "${DIR}/ignore/" || true
                tar xf git-${debian_stable_git}.tar.gz
                if [ -d git-${debian_stable_git} ] ; then
                        cd ./git-${debian_stable_git}/ || true
                        echo "scripts/git: building: [${debian_stable_git}]"

                        echo "scripts/git: [make -j${CORES} prefix=/usr/local all]"
                        make -j${CORES} prefix=/usr/local all

                        echo "scripts/git: [sudo make prefix=/usr/local install]"
                        sudo make prefix=/usr/local install

                        cd "${DIR}/ignore/" || true
                        rm -rf git-${debian_stable_git}/ || true
                        git_bin=$(which git)
                else
                        echo "scripts/git: failure to build: git-${debian_stable_git}.tar.gz"
                        exit 2
                fi
        else
                echo "scripts/git: failure to download: git-${debian_stable_git}.tar.gz"
                exit 2
        fi

}
unsecure_check_and_or_clone () {
        ${git_bin} clone "${unsecure_torvalds_linux}" "${DIR}/ignore/linux-src"
}
check_and_or_clone () {
        #For Legacy: moving to "${DIR}/ignore/linux-src/" for all new installs
        if [ ! "${LINUX_GIT}" ] && [ -f "${HOME}/linux-src/.git/config" ] ; then
                LINUX_GIT="${HOME}/linux-src"
        fi

        if [ ! "${LINUX_GIT}" ]; then
                if [ -f "${DIR}/ignore/linux-src/.git/config" ] ; then
                        echo "-----------------------------"
                        echo "scripts/git: LINUX_GIT not defined in system.sh"
                        echo "using default location: ${DIR}/ignore/linux-src/"
                else
                        echo "-----------------------------"
                        echo "scripts/git: LINUX_GIT not defined in system.sh"
                        echo "cloning ${torvalds_linux} into default location: ${DIR}/ignore/linux-src"
                        ${git_bin} clone "${torvalds_linux}" "${DIR}/ignore/linux-src" || unsecure_check_and_or_clone
                fi
                LINUX_GIT="${DIR}/ignore/linux-src"
        fi
}

git_kernel () {
        check_and_or_clone

        #In the past some users set LINUX_GIT = DIR, fix that...
        if [ -f "${LINUX_GIT}/version.sh" ] ; then
                unset LINUX_GIT
                echo "-----------------------------"
                echo "scripts/git: Warning: LINUX_GIT is set as DIR:"
                check_and_or_clone
        fi

        #is the git directory user writable?
        if [ ! -w "${LINUX_GIT}" ] ; then
                unset LINUX_GIT
                echo "-----------------------------"
                echo "scripts/git: Warning: LINUX_GIT is not writable:"
                check_and_or_clone
        fi

        #is it actually a git repo?
        if [ ! -f "${LINUX_GIT}/.git/config" ] ; then
                unset LINUX_GIT
                echo "-----------------------------"
                echo "scripts/git: Warning: LINUX_GIT is an invalid tree:"
                check_and_or_clone
        fi

        cd "${LINUX_GIT}/" || exit
        echo "-----------------------------"
        echo "scripts/git: Debug: LINUX_GIT is setup as: [${LINUX_GIT}]."
        echo "scripts/git: [$(cat .git/config | grep url | sed 's/\t//g' | sed 's/ //g')]"
        ${git_bin} fetch || true
        echo "-----------------------------"
        cd "${DIR}/" || exit

        if [ ! -f "${DIR}/KERNEL/.git/config" ] ; then
                rm -rf "${DIR}/KERNEL/" || true
                ${git_bin} clone --shared "${LINUX_GIT}" "${DIR}/KERNEL"
        fi

	#Automaticly, just recover the git repo from a git crash
        if [ -f "${DIR}/KERNEL/.git/index.lock" ] ; then
                rm -rf "${DIR}/KERNEL/" || true
                ${git_bin} clone --shared "${LINUX_GIT}" "${DIR}/KERNEL"
        fi

        cd "${DIR}/KERNEL/" || exit
}

. "${DIR}/version.sh"
. "${DIR}/system.sh"

#debian Stable:
#https://packages.debian.org/stable/git -> 2.1.4

git_bin=$(which git)

git_major=$(LC_ALL=C ${git_bin} --version | awk '{print $3}' | cut -d. -f1)
git_minor=$(LC_ALL=C ${git_bin} --version | awk '{print $3}' | cut -d. -f2)
git_sub=$(LC_ALL=C ${git_bin} --version | awk '{print $3}' | cut -d. -f3)

compare_major="2"
compare_minor="9"
compare_sub="5"
#compare_major="2"
#compare_minor="1"
#compare_sub="4"

if [ "${git_major}" -lt "${compare_major}" ] ; then
        build_git
elif [ "${git_major}" -eq "${compare_major}" ] ; then
        if [ "${git_minor}" -lt "${compare_minor}" ] ; then
                build_git
        elif [ "${git_minor}" -eq "${compare_minor}" ] ; then
                if [ "${git_sub}" -lt "${compare_sub}" ] ; then
                        build_git
                fi
        fi
fi

echo "scripts/git: [`LC_ALL=C ${git_bin} --version`]"

unset git_config_user_email
git_config_user_email=$(${git_bin} config --global --get user.email || true)
if [ ! "${git_config_user_email}" ] ; then
        ${git_bin} config --local user.email you@example.com
fi

unset git_config_user_name
git_config_user_name=$(${git_bin} config --global --get user.name || true)
if [ ! "${git_config_user_name}" ] ; then
        ${git_bin} config --local user.name "Your Name"
fi

torvalds_linux="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
unsecure_torvalds_linux="git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
linux_stable="https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git"
unsecure_linux_stable="git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git"
#unsecure_check_and_or_clone
#check_and_or_clone
git_kernel
