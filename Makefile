collect:

deploy:
	wget https://github.com/nothub/mrpack-install/releases/download/v0.23.0/mrpack-install_0.23.0_linux_amd64.tar.gz -O temp/mrpack-install.tar.gz
	cd dist && tar -xzf mrpack-install.tar.gz && chmod +x mrpack-install
	cp mc-server-mods/dist/Server.mrpack temp
	cd dist && mkdir minecraft
	cd dist && ./mrpack-install --server-dir minecraft Server.mrpack

clean:
	rm -rf dist/*