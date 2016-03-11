define green
	@tput setaf 2; echo $1; tput sgr0;
endef

terr_secret_vars_file=secretvars.json

.PHONY: packer
packer:
	packer build -var-file $(terr_secret_vars_file) starting.json
	$(call green,"[All steps successful]")
