# Maintainer: Bruce Zhang
pkgname=netease-cloud-music-gtk
pkgver=0.2.0
pkgrel=2
pkgdesc="Linux 平台下基于 Rust + GTK 开发的网易云音乐播放器"
arch=('i686' 'x86_64')
url="https://github.com/gmg137/netease-cloud-music-gtk"
license=('GPL3')
depends=('openssl' 'curl' 'gstreamer' 'gtk3' 'gst-plugins-bad')
makedepends=('rustup')
source=("https://github.com/gmg137/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('a1f05d8c68f071c7cbc229dcfda00779b46ae09f1888d4f92f6866b72ca1627d')

build() {
	cd "$pkgname-$pkgver"
	nightly_installed=$(rustup toolchain list | grep nightly | wc -l)
	
	if [ $nightly_installed == '0' ]; then
		rustup toolchain install nightly
	fi

	cargo +nightly build --release

	if [ $nightly_installed == '0' ]; then
		rustup toolchain uninstall nightly
	fi
}

package() {
	cd "$pkgname-$pkgver"
	
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"

	install -Dm 755 "target/release/netease-cloud-music-gtk" "$pkgdir/usr/bin/netease-cloud-music-gtk"
	install -Dm 755 "netease-cloud-music-gtk.desktop" "$pkgdir/usr/share/applications/netease-cloud-music-gtk.desktop"
	install -Dm 755 "icons/netease-cloud-music-gtk.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/netease-cloud-music-gtk.svg"
}
