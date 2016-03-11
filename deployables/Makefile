define green
	@tput setaf 2; echo $1; tput sgr0;
endef

terr_secret_vars_file=secretvars.json
packer_linux_64_zip=https://releases.hashicorp.com/packer/0.9.0/packer_0.9.0_linux_amd64.zip

.PHONY: pack
pack:
	packer build -var-file $(terr_secret_vars_file) starting.json
	$(call green,"[All steps successful]")

.PHONY: install_snap
install_snap:
	wget --no-verbose $(packer_linux_64_zip) -O ${SNAP_CACHE_DIR}/packer.zip
	unzip ${SNAP_CACHE_DIR}/packer.zip -d ${SNAP_CACHE_DIR}/packer
