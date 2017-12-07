cd python-app

sudo docker build -t mateuszlewko/ii-uwr-cloud-python-app:latest .  
sudo docker push mateuszlewko/ii-uwr-cloud-python-app:latest

# on server:
sudo docker run -p 5001:5000 -e APP_MSG="I'm a number one." --name app1 --rm -d mateuszlewko/ii-uwr-cloud-python-app:latest