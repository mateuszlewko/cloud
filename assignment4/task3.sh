sudo docker run -p 5101:5000 -e APP_MSG="I'm a number one." --name app-sd-1 --rm -d mateuszlewko/ii-uwr-cloud-python-app:latest
sudo docker run -p 5102:5000 -e APP_MSG="I'm a number two." --name app-sd-2 --rm -d mateuszlewko/ii-uwr-cloud-python-app:latest
sudo docker run -p 5103:5000 -e APP_MSG="I'm a number three." --name app-sd-3 --rm -d mateuszlewko/ii-uwr-cloud-python-app:latest

# in order to update
# 1. build
# 2. push
# 3. pull
sudo docker rm -g app-sd-1
sudo docker rm -g app-sd-2
sudo docker rm -g app-sd-3
# run again