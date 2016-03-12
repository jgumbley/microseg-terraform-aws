define green
	@tput setaf 2; echo $1; tput sgr0;
endef

terr_secret_vars_file=secretvars.json
packer_linux_64_zip=https://releases.hashicorp.com/packer/0.9.0/packer_0.9.0_linux_amd64.zip

packer_out=packer.out
amivers_file=../amivers.tfvars
.PHONY: pack
pack:
	PATH=${SNAP_CACHE_DIR}/packer/:${PATH}; packer build -var-file $(terr_secret_vars_file) starting.json | tee $(packer_out) 
	echo "ami_ver = \"`tail -2 $(packer_out) | head -2 | awk 'match($$0, /ami-.*/) { print substr($$0, RSTART, RLENGTH) }'`\"" > $(amivers_file)
	$(call green,"[All steps successful]")

.PHONY: install_snap
install_snap:
	wget -q --no-verbose $(packer_linux_64_zip) -O ${SNAP_CACHE_DIR}/packer.zip
	unzip -n ${SNAP_CACHE_DIR}/packer.zip -d ${SNAP_CACHE_DIR}/packer
