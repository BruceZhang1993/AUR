# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=majsoul-plus
pkgver=2.0.0a1
_pkgver=${pkgver/a/-alpha.}
pkgrel=1
pkgdesc="Majsoul browser, with more features"
arch=('x86_64' 'i686')
url="https://github.com/MajsoulPlus/majsoul-plus"
license=('AGPL3')
depends=('electron')
makedepends=('yarn' 'imagemagick')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/MajsoulPlus/majsoul-plus/archive/v$_pkgver.tar.gz")
sha256sums=('40aa0493276e1168e63373325824899884fa586e4d2bf5828fc79ac50273a08a')
conflicts=("majsoul-plus-bin")

prepare() {
	cd "$pkgname-$_pkgver"
	electronV=$(electron --version)
	electronVer=${electronV#v}
	targetArch="x64"
	if [ "$CARCH" == "i686" ]; then
		targetArch="ia32"
	fi
	sed -i "/\"electron\": \"/c\\\"electron\": \"$electronVer\"," package.json
	sed -i "/\"build-linux\": \"/c\\\"build-linux\": \"yarn pre-build && electron-builder --linux --$targetArch\"," package.json

	sed -i 's/"tar.gz",//' package.json
	sed -i 's/"AppImage"/"dir"/' package.json

	electronDist="\/usr\/lib\/electron"
	sed -i "s/\"productName\": \"Majsoul Plus\",/\"productName\": \"Majsoul Plus\",\"electronDist\": \"$electronDist\",/" package.json

	sed -i "s/level !== 'log'/String(level) !== 'log'/" src/index.ts
}

build() {
	cd "$pkgname-$_pkgver"
	yarn
	yarn run build-linux
}

package() {
	targetArch="x64"
	if [ "$CARCH" == "i686" ]; then
		targetArch="ia32"
	fi

	cd "$pkgname-$_pkgver"
	mkdir -p "$pkgdir/usr/share/majsoul-plus"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"

	install -Dm644 "build/linux-unpacked/resources/app.asar" "$pkgdir/usr/share/majsoul-plus/app.asar"

	for size in 16 24 32 48 64 72 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
        mkdir -p "$target"
        convert assets/bin/icons/icon.png -resize ${size}x${size} "$target/majsoul-plus.png"
    done

	echo "#!/usr/bin/env bash
exec electron --enable-logging /usr/share/majsoul-plus/app.asar" > "$srcdir/majsoul-plus.sh"
	install -Dm755 "$srcdir/majsoul-plus.sh" "$pkgdir/usr/bin/majsoul-plus"

	echo "[Desktop Entry]
Name=Majsoul Plus
Name[zh_CN]=雀魂 Plus
GenericName[zh_CN]=雀魂 Plus
Comment=Majsoul Plus Browser
Comment[zh_CN]=一款设计用于雀魂麻将的 PC 专用浏览器
Exec=majsoul-plus %U
Terminal=false
Type=Application
Icon=majsoul-plus
Categories=Game;" > "$srcdir/majsoul-plus.desktop"
	install -Dm644 "$srcdir/majsoul-plus.desktop" "$pkgdir/usr/share/applications/majsoul-plus.desktop"
}
