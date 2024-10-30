virginia:
	terraform workspace select virginia || terraform workspace select virginia
	terraform init
	terraform apply -var-file virginia.tfvars --auto-approve
	
ohio:
	terraform workspace new ohio || terraform workspace select ohio
	terraform init
	terraform apply -var-file ohio.tfvars --auto-approve

oregon:
	terraform workspace select oregon || terraform workspace select oregon
	terraform init
	terraform apply -var-file oregon.tfvars --auto-approve

cali:
	terraform workspace select cali || terraform workspace select cali
	terraform init
	terraform apply -var-file cali.tfvars --auto-approve
apply-all: virginia ohio oregon cali

virginia-destroy:
	terraform workspace new virginia || terraform workspace select virginia
	terraform init
	terraform destroy -var-file virginia.tfvars --auto-approve

ohio-destroy:
	terraform workspace new ohio || terraform workspace select ohio
	terraform init
	terraform destroy -var-file ohio.tfvars --auto-approve

oregon-destroy:
	terraform workspace new oregon || terraform workspace select oregon
	terraform init
	terraform destroy -var-file oregon.tfvars --auto-approve

cali-destroy:
	terraform workspace new cali || terraform workspace select cali
	terraform init
	terraform destroy -var-file cali.tfvars --auto-approve
apply-all: virginia-destroy ohio-destroy oregon-destroy cali-destroy