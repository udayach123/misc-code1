infra:
	git pull
	terraform init
	terraform apply -auto-approve

ansible:
	git pull
	ansible-playbook -i $(tool_name)dev-yourtherapist.in, -e ansible_user=devops18 -e ansible_password=Passw0rd@1234 tool_setup.yml -e tool_name=$(tool_name)