# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=feeluown-git
_pkgname=FeelUOwn
pkgver=6.0r8.gf458d8c
pkgrel=1
epoch=1
pkgdesc="个性化音乐服务 For Mac And Linux"
arch=("any")
url="https://github.com/cosven/FeelUOwn"
license=('GPL3')
depends=('python-pyqt5' 'qt5-webkit' 'python-xlib' 'qt5-multimedia' 'python-requests' 'python-quamash' 'xdg-utils' 'python-sqlalchemy')
optdepends=('vlc')
makedepends=('git')
provides=("feeluown")
conflicts=("feeluown")
source=('git://github.com/cosven/FeelUOwn.git')
md5sums=('SKIP')
_desktop="${_pkgname}.desktop"

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags | sed 's/^v//;s/release./r/;s/-/./g'
}

build() {
    cd "$srcdir"
    cat > ${_desktop} << EOF
[Desktop Entry]
Type=Application
Name=FeelUOwn
Comment=FeelUOwn Launcher
Exec=${_pkgname}
Icon=/usr/share/${pkgname}/icons/FeelUOwn.png
Categories=AudioVideo;Audio;Player;Qt;
Terminal=false
StartupNotify=true
EOF

    cat > "${_pkgname}.sh" << EOF
#!/usr/bin/env sh
python /usr/share/${pkgname}/feeluown/main.py \$*
EOF
}

package() {
    cd "$srcdir/$_pkgname"
    find ./{feeluown,icons} -type f -exec install -Dm644 {} \
        "${pkgdir}/usr/share/${pkgname}/{}" \;

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
