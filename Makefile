.PHONY: build deploy ensure-dist mrpack clean

build: clean ensure-dist
	$(MAKE) -C mc-server-packs build
	python3 modrinth-cli/modrinth.py pack export -f mrpack -o dist/Server.mrpack

deploy: mrpack
	cd dist && ./mrpack-install --server-dir minecraft --server-file server.jar Server.mrpack

test:
	cd dist/minecraft && echo "eula=true" > eula.txt
	cd dist/minecraft && java -Xmx1024M -Xms1024M -jar server.jar nogui

ensure-dist:
	mkdir -p dist

mrpack:
	wget https://github.com/nothub/mrpack-install/releases/download/v0.23.0/mrpack-install_0.23.0_linux_amd64.tar.gz -O dist/mrpack-install.tar.gz
	cd dist && tar -xzf mrpack-install.tar.gz && chmod +x mrpack-install

clean:
	rm -rf dist/*