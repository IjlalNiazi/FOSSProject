install: project_ui-ur.mo
	install project_channel project_ui project_localization /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat project.services`" /etc/services || cat project.services >> /etc/services
	install project.xinetd /etc/xinetd.d/project_channel
	ln -sf /usr/local/bin/project_ui /usr/local/bin/project_gui
	ln -sf /usr/local/bin/project_ui /usr/local/bin/project_network
	install project_ui-ur.mo /usr/share/locale/ur/LC_MESSAGES/project_ui.mo
	systemctl start xinetd
	systemctl reload xinetd

project_ui.pot: project_ui
	xgettext -o project_ui.pot -L Shell project_ui

project_ui-ur.mo: project_ui-ur.po
	msgfmt -o project_ui-ur.mo project_ui-ur.po

clone:
	git clone https://github.com/IjlalNiazi/FOSSProject

download:
	git pull

upload:
	git add -A
	git commit
	git push origin 

tags:
	git push origin --tags
