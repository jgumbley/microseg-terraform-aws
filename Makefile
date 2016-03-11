define green
	@tput setaf 2; echo $1; tput sgr0;
endef

terr_secret_vars_file=secretvars.tfvars

.PHONY: terraform
terraform:
	terraform apply -var-file $(terr_secret_vars_file)
	$(call green,"[All steps successful]")

.PHONY: clean
clean:
	terraform destroy -var-file $(terr_secret_vars_file)
	$(call green,"[All steps successful]")

