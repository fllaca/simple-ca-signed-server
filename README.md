# LetsEncrypt CA Signed Server - and auto-renewal!

This project is a set of Ansible roles to perform a basic installation of HaProxy + Dehydrated (for automatic LetsEncrypt certificates renewal), using DuckDNS as DNS provider. 

The `dehydrated` role installs a cron job that will renew the certificates with the Let's Encrypt Authority every first day of month.

## Play with it!

1 - Copy `files-example` to files and replace the contents of those files with your DuckDNS domain and token.

2 - Create an inventory file with the host of the server. Example:

```
192.168.1.121
```

3 - Run the playbooks:

```
ansible-playbook -i inventory dehydrated.yaml
ansible-playbook -i inventory haproxy.yaml
```

