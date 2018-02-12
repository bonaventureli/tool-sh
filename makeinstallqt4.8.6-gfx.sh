#tar zxvf qt-everywhere-opensource-src-4.8.6.tar.gz
read -p "Are you sure your dir is ../qt-everywhere-opensource-src-4.8.6?:(y/n)" YN
if [ $YN == 'Y' ] || [ $YN == 'y' ]; then
{
read -p "Your install dir will be /usr/local/Trolltech/QtEmbedded-4.8.6-tslib-gfx:(y/n)" YN
if [ "$YN" == 'Y' ] || [ "$YN" == 'y' ]; then
./configure -prefix  /usr/local/Trolltech/QtEmbedded-4.8.6-tslib-gfx1 \
        -opensource \
        -confirm-license \
        -release  \
        -embedded armv7 \
        -xplatform qws/linux-am335x-g++ \
        -svg\
        -no-cups\
        -shared\
        -no-largefile\
        -no-accessibility\
        -no-xrender\
        -depths 16,18,24 \
        -fast \
        -optimized-qmake \
        -pch \
        -qt-sql-sqlite \
        -qt-libjpeg \
        -qt-zlib \
        -qt-libpng \
        -qt-freetype \
        -little-endian  -host-little-endian \
        -no-qt3support  \
        -no-libtiff   -no-libmng \
        -no-opengl \
        -no-mmx  -no-sse  -no-sse2 \
        -no-3dnow \
        -no-openssl \
        -no-webkit \
        -no-qvfb \
        -no-phonon \
        -no-nis \
        -no-opengl \
        -no-cups \
        -no-xcursor   -no-xfixes  -no-xrandr   -no-xrender \
        -no-separate-debug-info \
        -nomake examples   -nomake  tools   -nomake docs -nomake demos\
        -plugin-mouse-pc\
        -lrt\
        -no-libjpeg\
	-qt-mouse-tslib \
	-qt-gfx-linuxfb\
	-qt-gfx-transformed\
	-D QT_NO_QWS_CURSOR\
        -D QT_QWS_CLIENTBLIT



#Build .................. libs translations
#Configuration ..........  cross_compile release embedded stl precompile_header neon exceptions_off  minimal-config small-config medium-config large-config full-config no-pkg-config shared embedded reduce_exports ipv6 clock-gettime clock-monotonic mremap getaddrinfo ipv6ifname getifaddrs inotify no-jpeg no-mng png no-tiff freetype zlib concurrent multimedia audio-backend svg script scripttools declarative release
#Debug .................. no
#Qt 3 compatibility ..... no
#QtDBus module .......... no
#QtConcurrent code ...... yes
#QtGui module ........... yes
#QtScript module ........ yes
#QtScriptTools module ... yes
#QtXmlPatterns module ... no
#Phonon module .......... no
#Multimedia module ...... auto
#SVG module ............. yes
#WebKit module .......... no
#JavaScriptCore JIT ..... To be decided by JavaScriptCore
#Declarative module ..... yes
#Declarative debugging ...yes
#Support for S60 ........ no
#Symbian DEF files ...... no
#STL support ............ yes
#PCH support ............ yes
#MMX/3DNOW/SSE/SSE2/SSE3. no/no/no/no/no
#SSSE3/SSE4.1/SSE4.2..... no/no/no
#AVX..................... no
#iWMMXt support ......... no
#NEON support ........... yes
#IPv6 support ........... yes
#IPv6 ifname support .... yes
#getaddrinfo support .... yes
#getifaddrs support ..... yes
#Accessibility .......... no
#NIS support ............ no
#CUPS support ........... no
#Iconv support .......... no
#Glib support ........... no
#GStreamer support ...... no
#PulseAudio support ..... no
#Large File support ..... no
#GIF support ............ plugin
#TIFF support ........... no
#JPEG support ........... no
#PNG support ............ yes (qt)
#MNG support ............ no
#zlib support ........... yes
#Session management ..... no
#Embedded support ....... armv7
#Freetype2 support ...... yes
#Graphics (qt) .......... linuxfb multiscreen linuxfb transformed
#Graphics (plugin) ...... 
#Decorations (qt) ....... styled windows default
#Decorations (plugin) ... 
#Keyboard driver (qt) ... tty
#Keyboard driver (plugin) .. 
#Mouse driver (qt) ...... linuxtp tslib
#Mouse driver (plugin) .. pc
#OpenGL support ......... no
#OpenVG support ......... no
#SQLite support ......... qt (qt)
#OpenSSL support ........ no 
#Alsa support ........... no
#ICD support ............ no
#libICU support ......... no
#Use system proxies ..... no
#

else
exit 0
fi
}
else
exit 0
fi

