gcloud compute instances create web-app-instance1 --zone us-east1-b --machine-type f1-micro
gcloud compute config-ssh web-app-instance1 --ssh-key-file ~/.ssh/id_rsa.pub
