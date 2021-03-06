DEFAULT_BACKGROUND=desktop-background

INSTALL=install -m 0644
BACKGROUNDS=$(wildcard backgrounds/*.png backgrounds/*.jpg backgrounds/*.svg backgrounds/*.tga backgrounds/*.xml)
SPLASH=$(wildcard splash/*.png splash/*.svg)
PIXMAPS=$(wildcard pixmaps/*.png)
DESKTOPFILES=$(wildcard *.desktop)

all:

clean:

install:
	# background files
	mkdir -p $(DESTDIR)/usr/share/images/desktop-base
	$(INSTALL) $(BACKGROUNDS) $(DESTDIR)/usr/share/images/desktop-base
	cd $(DESTDIR)/usr/share/images/desktop-base && ln -s $(DEFAULT_BACKGROUND) default
	# splash files
	$(INSTALL) $(SPLASH) $(DESTDIR)/usr/share/images/desktop-base
	# emblems
	mkdir -p $(DESTDIR)/usr/share/icons/hicolor/36x36/emblems
	$(INSTALL) $(wildcard icons/36x36/emblems/*) $(DESTDIR)/usr/share/icons/hicolor/36x36/emblems
	mkdir -p $(DESTDIR)/usr/share/icons/hicolor/64x64/emblems
	$(INSTALL) $(wildcard icons/64x64/emblems/*) $(DESTDIR)/usr/share/icons/hicolor/64x64/emblems
	mkdir -p $(DESTDIR)/usr/share/icons/hicolor/128x128/emblems
	$(INSTALL) $(wildcard icons/128x128/emblems/*) $(DESTDIR)/usr/share/icons/hicolor/128x128/emblems
	mkdir -p $(DESTDIR)/usr/share/icons/hicolor/scalable/emblems
	$(INSTALL) $(wildcard icons/scalable/emblems/*) $(DESTDIR)/usr/share/icons/hicolor/scalable/emblems
	# desktop files
	mkdir -p $(DESTDIR)/usr/share/desktop-base
	$(INSTALL) $(DESKTOPFILES) $(DESTDIR)/usr/share/desktop-base/
	# pixmaps files
	mkdir -p $(DESTDIR)/usr/share/pixmaps
	$(INSTALL) $(PIXMAPS) $(DESTDIR)/usr/share/pixmaps/

	# KDE Config
	mkdir -p $(DESTDIR)/usr/share/desktop-base/profiles/kde-profile/share/config
	$(INSTALL) $(wildcard profiles/kde-profile/share/config/*) $(DESTDIR)/usr/share/desktop-base/profiles/kde-profile/share/config
	mkdir -p $(DESTDIR)/usr/share/kde4/config
	$(INSTALL) profiles/kde-profile/kdeglobals $(DESTDIR)/usr/share/kde4/config
	mkdir -p $(DESTDIR)/usr/share/kde4/apps/plasma-desktop/init/
	$(INSTALL) kde-wallpaper/10-desktop-base.js $(DESTDIR)/usr/share/kde4/apps/plasma-desktop/init/

	# KDE Wallpaper
	## Anger
	mkdir -p $(DESTDIR)/usr/share/wallpapers/anger
	$(INSTALL) kde-wallpaper/anger/metadata.desktop $(DESTDIR)/usr/share/wallpapers/anger/
	mkdir -p $(DESTDIR)/usr/share/wallpapers/anger/contents
	$(INSTALL) kde-wallpaper/anger/contents/screenshot.png $(DESTDIR)/usr/share/wallpapers/anger/contents/
	mkdir -p $(DESTDIR)/usr/share/wallpapers/anger/contents/images
	$(INSTALL) $(wildcard kde-wallpaper/anger/contents/images/*) $(DESTDIR)/usr/share/wallpapers/anger/contents/images/
	## Eta
	mkdir -p $(DESTDIR)/usr/share/wallpapers/eta
	$(INSTALL) kde-wallpaper/eta/metadata.desktop $(DESTDIR)/usr/share/wallpapers/eta/
	mkdir -p $(DESTDIR)/usr/share/wallpapers/eta/contents
	$(INSTALL) kde-wallpaper/eta/contents/screenshot.png $(DESTDIR)/usr/share/wallpapers/eta/contents/
	mkdir -p $(DESTDIR)/usr/share/wallpapers/eta/contents/images
	$(INSTALL) $(wildcard kde-wallpaper/eta/contents/images/*) $(DESTDIR)/usr/share/wallpapers/eta/contents/images/
	## Gray
	mkdir -p $(DESTDIR)/usr/share/wallpapers/gray
	$(INSTALL) kde-wallpaper/gray/metadata.desktop $(DESTDIR)/usr/share/wallpapers/gray/
	mkdir -p $(DESTDIR)/usr/share/wallpapers/gray/contents
	$(INSTALL) kde-wallpaper/gray/contents/screenshot.png $(DESTDIR)/usr/share/wallpapers/gray/contents/
	mkdir -p $(DESTDIR)/usr/share/wallpapers/gray/contents/images
	$(INSTALL) $(wildcard kde-wallpaper/gray/contents/images/*) $(DESTDIR)/usr/share/wallpapers/gray/contents/images/


	# KDM theme
	mkdir -p $(DESTDIR)/etc/default/kdm.d
	$(INSTALL) kdm-theme/kdm.d/10_desktop-base $(DESTDIR)/etc/default/kdm.d
	mkdir -p $(DESTDIR)/usr/share/kde4/apps/kdm/themes/eta
	$(INSTALL) $(wildcard kdm-theme/eta/*) $(DESTDIR)/usr/share/kde4/apps/kdm/themes/eta

	# KSPLASH themes
	## Eta
	install -d $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/eta/images
	$(INSTALL) $(wildcard ksplash-theme/eta/*.qml) $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/eta
	$(INSTALL) $(wildcard ksplash-theme/eta/*.png) $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/eta
	$(INSTALL) $(wildcard ksplash-theme/eta/*.rc) $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/eta
	$(INSTALL) $(wildcard ksplash-theme/eta/images/*) $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/eta/images


	# Xfce 4.6
	mkdir -p $(DESTDIR)/usr/share/desktop-base/profiles/xdg-config/xfce4/xfconf/xfce-perchannel-xml
	$(INSTALL) $(wildcard profiles/xdg-config/xfce4/xfconf/xfce-perchannel-xml/*) $(DESTDIR)/usr/share/desktop-base/profiles/xdg-config/xfce4/xfconf/xfce-perchannel-xml
	# GNOME background descriptor
	mkdir -p $(DESTDIR)/usr/share/gnome-background-properties
	$(INSTALL) gnome-backgrounds.xml $(DESTDIR)/usr/share/gnome-background-properties/debian.xml
	# login background
	$(INSTALL) login/background.svg $(DESTDIR)/usr/share/images/desktop-base/login-background.svg

	# grub
	$(INSTALL) grub/pardus-grub.png $(DESTDIR)/usr/share/images/desktop-base/
	$(INSTALL) grub/pardus-grub-1920x1080.png $(DESTDIR)/usr/share/images/desktop-base/
	$(INSTALL) grub/grub_background.sh $(DESTDIR)/usr/share/desktop-base/

	# plymouth
	install -d $(DESTDIR)/usr/share/plymouth/themes/runner
	$(INSTALL) $(wildcard plymouth/runner/*) $(DESTDIR)/usr/share/plymouth/themes/runner
