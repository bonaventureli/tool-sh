#!/bin/bash -e
ARCH=$(uname -m)
DIR=$PWD

. "${DIR}/system.sh"

#For:
#toolchain
. "${DIR}/version.sh"

gcc_dir="${DIR}/dl"
dl_gcc_generic () {
        WGET="wget -c --directory-prefix=${gcc_dir}/"
        if [ ! -f "${gcc_dir}/${directory}/${datestamp}" ] ; then
                echo "Installing: ${toolchain_name}"
                echo "-----------------------------"
                ${WGET} "${site}/${version}/${filename}" || ${WGET} "${archive_site}/${version}/${filename}"
                if [ -d "${gcc_dir}/${directory}" ] ; then
                        rm -rf "${gcc_dir}/${directory}" || true
                fi
                tar -xf "${gcc_dir}/${filename}" -C "${gcc_dir}/"
                if [ -f "${gcc_dir}/${directory}/${binary}gcc" ] ; then
                        touch "${gcc_dir}/${directory}/${datestamp}"
                fi
        fi

        if [ "x${ARCH}" = "xarmv7l" ] ; then
                #using native gcc
                CC=
        else
                CC="${gcc_dir}/${directory}/${binary}"
        fi
}
gcc_toolchain () {
        site="https://releases.linaro.org"
        archive_site="https://releases.linaro.org/archive"
        case "${toolchain}" in
        gcc_linaro_eabi_4_8)
                #
                #https://releases.linaro.org/14.04/components/toolchain/binaries/gcc-linaro-arm-none-eabi-4.8-2014.04_linux.tar.xz
                #
                gcc_version="4.8"
                release="2014.04"
                toolchain_name="gcc-linaro-arm-none-eabi"
                version="14.04/components/toolchain/binaries"
                directory="${toolchain_name}-${gcc_version}-${release}_linux"
                filename="${directory}.tar.xz"
                datestamp="${release}-${toolchain_name}"

                binary="bin/arm-none-eabi-"
                ;;
        gcc_linaro_eabi_4_9_i686)
                #
                #https://releases.linaro.org/components/toolchain/binaries/4.9-2017.01/arm-eabi/gcc-linaro-4.9.4-2017.01-i686_arm-eabi.tar.xz
                #

                gcc_version="4.9"
                gcc_minor=".4"
                release="17.01"
                target="arm-eabi"

                version="components/toolchain/binaries/${gcc_version}-20${release}/${target}"
                filename="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-i686_${target}.tar.xz"
                directory="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-i686_${target}"

                binary="bin/${target}-"
                ;;
	gcc_linaro_eabi_4_9)
                #
                #https://releases.linaro.org/components/toolchain/binaries/4.9-2017.01/arm-eabi/gcc-linaro-4.9.4-2017.01-x86_64_arm-eabi.tar.xz
                #

                gcc_version="4.9"
                gcc_minor=".4"
                release="17.01"
                target="arm-eabi"

                version="components/toolchain/binaries/${gcc_version}-20${release}/${target}"
                filename="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}.tar.xz"
                directory="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}"

                datestamp="${gcc_version}-20${release}-${target}"

                binary="bin/${target}-"
                ;;
        gcc_linaro_eabi_5)
                #
                #https://releases.linaro.org/components/toolchain/binaries/5.4-2017.05/arm-eabi/gcc-linaro-5.4.1-2017.05-x86_64_arm-eabi.tar.xz
                #https://releases.linaro.org/components/toolchain/binaries/5.5-2017.10/arm-eabi/gcc-linaro-5.5.0-2017.10-x86_64_arm-eabi.tar.xz
                #

                gcc_version="5.5"
                gcc_minor=".0"
                release="17.10"
                target="arm-eabi"

                version="components/toolchain/binaries/${gcc_version}-20${release}/${target}"
                filename="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}.tar.xz"
                directory="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}"

                datestamp="${gcc_version}-20${release}-${target}"

                binary="bin/${target}-"
                ;;
	gcc_linaro_eabi_6)
                #
                #https://releases.linaro.org/components/toolchain/binaries/6.3-2017.05/arm-eabi/gcc-linaro-6.3.1-2017.05-x86_64_arm-eabi.tar.xz
                #https://releases.linaro.org/components/toolchain/binaries/6.4-2017.08/arm-eabi/gcc-linaro-6.4.1-2017.08-x86_64_arm-eabi.tar.xz
                #https://releases.linaro.org/components/toolchain/binaries/6.4-2017.11/arm-eabi/gcc-linaro-6.4.1-2017.11-x86_64_arm-eabi.tar.xz
                #

                gcc_version="6.4"
                gcc_minor=".1"
                release="17.11"
                target="arm-eabi"

                version="components/toolchain/binaries/${gcc_version}-20${release}/${target}"
                filename="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}.tar.xz"
                directory="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}"

                datestamp="${gcc_version}-20${release}-${target}"

                binary="bin/${target}-"
                ;;
        gcc_linaro_eabi_7)
                #
                #https://releases.linaro.org/components/toolchain/binaries/7.1-2017.05/arm-eabi/gcc-linaro-7.1.1-2017.05-x86_64_arm-eabi.tar.xz
                #https://releases.linaro.org/components/toolchain/binaries/7.1-2017.08/arm-eabi/gcc-linaro-7.1.1-2017.08-x86_64_arm-eabi.tar.xz
                #https://releases.linaro.org/components/toolchain/binaries/7.2-2017.11/arm-eabi/gcc-linaro-7.2.1-2017.11-x86_64_arm-eabi.tar.xz
                #
                #site="https://snapshots.linaro.org"

                gcc_version="7.2"
                gcc_minor=".1"
                release="17.11"
                target="arm-eabi"

                version="components/toolchain/binaries/${gcc_version}-20${release}/${target}"
                filename="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}.tar.xz"
                directory="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}"

                datestamp="${gcc_version}-20${release}-${target}"

                binary="bin/${target}-"
                ;;
	gcc_linaro_gnueabi_4_6)
                #
                #https://releases.linaro.org/12.03/components/toolchain/binaries/gcc-linaro-arm-linux-gnueabi-2012.03-20120326_linux.tar.bz2
                #https://releases.linaro.org/archive/12.03/components/toolchain/binaries/gcc-linaro-arm-linux-gnueabi-2012.03-20120326_linux.tar.bz2
                #

                release="2012.03"
                toolchain_name="gcc-linaro-arm-linux-gnueabi"
                version="12.03/components/toolchain/binaries"
                version_date="20120326"
                directory="${toolchain_name}-${release}-${version_date}_linux"
                filename="${directory}.tar.bz2"
                datestamp="${version_date}-${toolchain_name}"

                binary="bin/arm-linux-gnueabi-"
                ;;
        gcc_linaro_gnueabihf_4_7)
                #
                #https://releases.linaro.org/13.04/components/toolchain/binaries/gcc-linaro-arm-linux-gnueabihf-4.7-2013.04-20130415_linux.tar.xz
                #https://releases.linaro.org/archive/13.04/components/toolchain/binaries/gcc-linaro-arm-linux-gnueabihf-4.7-2013.04-20130415_linux.tar.xz
                #

                gcc_version="4.7"
                release="2013.04"
                toolchain_name="gcc-linaro-arm-linux-gnueabihf"
                version="13.04/components/toolchain/binaries"
                version_date="20130415"
                directory="${toolchain_name}-${gcc_version}-${release}-${version_date}_linux"
                filename="${directory}.tar.xz"
                datestamp="${version_date}-${toolchain_name}"

                binary="bin/arm-linux-gnueabihf-"
                ;;
	gcc_linaro_gnueabihf_4_8)
                #
                #https://releases.linaro.org/14.04/components/toolchain/binaries/gcc-linaro-arm-linux-gnueabihf-4.8-2014.04_linux.tar.xz
                #

                gcc_version="4.8"
                release="2014.04"
                toolchain_name="gcc-linaro-arm-linux-gnueabihf"
                version="14.04/components/toolchain/binaries"
                directory="${toolchain_name}-${gcc_version}-${release}_linux"
                filename="${directory}.tar.xz"
                datestamp="${release}-${toolchain_name}"

                binary="bin/arm-linux-gnueabihf-"
                ;;
        gcc_linaro_gnueabihf_4_9_i686)
                #
                #https://releases.linaro.org/components/toolchain/binaries/4.9-2017.01/arm-linux-gnueabihf/gcc-linaro-4.9.4-2017.01-i686_arm-linux-gnueabihf.tar.xz
                #

                gcc_version="4.9"
                gcc_minor=".4"
                release="17.01"
                target="arm-linux-gnueabihf"

                version="components/toolchain/binaries/${gcc_version}-20${release}/${target}"
                filename="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-i686_${target}.tar.xz"
                directory="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-i686_${target}"

                datestamp="${gcc_version}-20${release}-${target}"

                binary="bin/${target}-"
                ;;
	gcc_linaro_gnueabihf_4_9)
                #
                #https://releases.linaro.org/components/toolchain/binaries/4.9-2017.01/arm-linux-gnueabihf/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf.tar.xz
                #

                gcc_version="4.9"
                gcc_minor=".4"
                release="17.01"
                target="arm-linux-gnueabihf"

                version="components/toolchain/binaries/${gcc_version}-20${release}/${target}"
                filename="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}.tar.xz"
                directory="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}"

                datestamp="${gcc_version}-20${release}-${target}"

                binary="bin/${target}-"
                ;;
        gcc_linaro_gnueabihf_5)
                #
                #https://releases.linaro.org/components/toolchain/binaries/5.4-2017.05/arm-linux-gnueabihf/gcc-linaro-5.4.1-2017.05-x86_64_arm-linux-gnueabihf.tar.xz
                #https://releases.linaro.org/components/toolchain/binaries/5.5-2017.10/arm-linux-gnueabihf/gcc-linaro-5.5.0-2017.10-x86_64_arm-linux-gnueabihf.tar.xz
                #

                gcc_version="5.5"
                gcc_minor=".0"
                release="17.10"
                target="arm-linux-gnueabihf"

                version="components/toolchain/binaries/${gcc_version}-20${release}/${target}"
                filename="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}.tar.xz"
                directory="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}"

                datestamp="${gcc_version}-20${release}-${target}"

                binary="bin/${target}-"
                ;;
	gcc_linaro_gnueabihf_6)
                #
                #https://releases.linaro.org/components/toolchain/binaries/6.3-2017.05/arm-linux-gnueabihf/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf.tar.xz
                #https://releases.linaro.org/components/toolchain/binaries/6.4-2017.08/arm-linux-gnueabihf/gcc-linaro-6.4.1-2017.08-x86_64_arm-linux-gnueabihf.tar.xz
                #https://releases.linaro.org/components/toolchain/binaries/6.4-2017.11/arm-linux-gnueabihf/gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
                #

                gcc_version="6.4"
                gcc_minor=".1"
                release="17.11"
                target="arm-linux-gnueabihf"

                version="components/toolchain/binaries/${gcc_version}-20${release}/${target}"
                filename="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}.tar.xz"
                directory="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}"

                datestamp="${gcc_version}-20${release}-${target}"

                binary="bin/${target}-"
                ;;
	gcc_linaro_gnueabihf_7)
                #
                #https://releases.linaro.org/components/toolchain/binaries/7.1-2017.05/arm-linux-gnueabihf/gcc-linaro-7.1.1-2017.05-x86_64_arm-linux-gnueabihf.tar.xz
                #https://releases.linaro.org/components/toolchain/binaries/7.1-2017.08/arm-linux-gnueabihf/gcc-linaro-7.1.1-2017.08-x86_64_arm-linux-gnueabihf.tar.xz
                #https://releases.linaro.org/components/toolchain/binaries/7.2-2017.11/arm-linux-gnueabihf/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz
                #
                #site="https://snapshots.linaro.org"

                gcc_version="7.2"
                gcc_minor=".1"
                release="17.11"
                target="arm-linux-gnueabihf"

                version="components/toolchain/binaries/${gcc_version}-20${release}/${target}"
                filename="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}.tar.xz"
                directory="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}"

                datestamp="${gcc_version}-20${release}-${target}"

                binary="bin/${target}-"
                ;;
	gcc_linaro_aarch64_gnu_5)
                #
                #https://releases.linaro.org/components/toolchain/binaries/5.4-2017.05/aarch64-linux-gnu/gcc-linaro-5.4.1-2017.05-x86_64_aarch64-linux-gnu.tar.xz
                #https://releases.linaro.org/components/toolchain/binaries/5.5-2017.10/aarch64-linux-gnu/gcc-linaro-5.5.0-2017.10-x86_64_aarch64-linux-gnu.tar.xz
                #

                gcc_version="5.5"
                gcc_minor=".0"
                release="17.10"
                target="aarch64-linux-gnu"

                version="components/toolchain/binaries/${gcc_version}-20${release}/${target}"
                filename="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}.tar.xz"
                directory="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}"

                datestamp="${gcc_version}-20${release}-${target}"

                binary="bin/${target}-"
                ;;
        gcc_linaro_aarch64_gnu_6)
                #
                #https://releases.linaro.org/components/toolchain/binaries/6.3-2017.05/aarch64-linux-gnu/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu.tar.xz
                #https://releases.linaro.org/components/toolchain/binaries/6.4-2017.08/aarch64-linux-gnu/gcc-linaro-6.4.1-2017.08-x86_64_aarch64-linux-gnu.tar.xz
                #https://releases.linaro.org/components/toolchain/binaries/6.4-2017.11/aarch64-linux-gnu/gcc-linaro-6.4.1-2017.11-x86_64_aarch64-linux-gnu.tar.xz
                #

                gcc_version="6.4"
                gcc_minor=".1"
                release="17.11"
                target="aarch64-linux-gnu"

                version="components/toolchain/binaries/${gcc_version}-20${release}/${target}"
                filename="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}.tar.xz"
                directory="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}"

                datestamp="${gcc_version}-20${release}-${target}"

                binary="bin/${target}-"
                ;;
		gcc_linaro_aarch64_gnu_7)
                #
                #https://releases.linaro.org/components/toolchain/binaries/7.1-2017.05/aarch64-linux-gnu/gcc-linaro-7.1.1-2017.05-x86_64_aarch64-linux-gnu.tar.xz
                #https://releases.linaro.org/components/toolchain/binaries/7.1-2017.08/aarch64-linux-gnu/gcc-linaro-7.1.1-2017.08-x86_64_aarch64-linux-gnu.tar.xz
                #https://releases.linaro.org/components/toolchain/binaries/7.2-2017.11/aarch64-linux-gnu/gcc-linaro-7.2.1-2017.11-x86_64_aarch64-linux-gnu.tar.xz
                #
                #site="https://snapshots.linaro.org"

                gcc_version="7.2"
                gcc_minor=".1"
                release="17.11"
                target="aarch64-linux-gnu"

                version="components/toolchain/binaries/${gcc_version}-20${release}/${target}"
                filename="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}.tar.xz"
                directory="gcc-linaro-${gcc_version}${gcc_minor}-20${release}-x86_64_${target}"

                datestamp="${gcc_version}-20${release}-${target}"

                binary="bin/${target}-"
                ;;

        *)
                echo "bug: maintainer forgot to set:"
                echo "toolchain=\"xzy\" in version.sh"
                exit 1
                ;;
        esac

        dl_gcc_generic
}

if [ "x${CC}" = "x" ] && [ "x${ARCH}" != "xarmv7l" ] ; then
        if [ "x${ARCH}" = "xi686" ] ; then
                if [ "x${toolchain}" = "xgcc_linaro_eabi_4_9" ] ; then
                        toolchain="gcc_linaro_eabi_4_9_i686"
                fi

                if [ "x${toolchain}" = "xgcc_linaro_gnueabihf_4_9" ] ; then
                        toolchain="gcc_linaro_gnueabihf_4_9_i686"
                fi

        fi
        gcc_toolchain
fi
unset check
if [ "x${KERNEL_ARCH}" = "xarm" ] ; then
        check="arm"
fi
if [ "x${KERNEL_ARCH}" = "xarm64" ] ; then
        check="aarch64"
fi

GCC_TEST=$(LC_ALL=C "${CC}gcc" -v 2>&1 | grep "Target:" | grep ${check} || true)

if [ "x${GCC_TEST}" = "x" ] ; then
        echo "-----------------------------"
        echo "scripts/gcc: Error: The GCC Cross Compiler you setup in system.sh (CC variable) is invalid."
        echo "-----------------------------"
        gcc_toolchain
fi

echo "-----------------------------"
echo "scripts/gcc: Using: $(LC_ALL=C "${CC}"gcc --version)"
echo "-----------------------------"
echo "CC=${CC}" > "${DIR}/.CC"

