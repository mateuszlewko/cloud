# on server:
sudo apt install docker.io

sudo docker run -p 80:80 --name the-nginx -d nginx

# locally:
# haproxy dockerimage which binds port 80 (loadbalancer) to 79 (app)
cd haproxy

sudo docker login

# sudo docker build -t my-haproxy .
sudo docker build -t mateuszlewko/ii-uwr-cloud-haproxy:
sudo docker push docker.io/mateuszlewko/ii-uwr-cloud-haproxy:latest

# on server: 
sudo docker stop the-nginx
sudo docker rm the-nginx # remove previous

sudo docker run --name the-nginx -d -rm nginx

sudo docker run -p 80:80 --add-host server1:172.17.0.2 --name haproxy-at-80 --rm -d mateuszlewko/ii-uwr-cloud-haproxy:latest