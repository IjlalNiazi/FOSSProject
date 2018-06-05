install:
	install project_channel project_ui /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat project.services`" /etc/services || cat project.services >> /etc/services
	install project.xinetd /etc/xinetd.d/project_channel
	ln -sf /usr/local/bin/project_ui /usr/local/bin/project_gui
	ln -sf /usr/local/bin/project_ui /usr/local/bin/project_network
	systemctl start xinetd
	systemctl reload xinetd

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
