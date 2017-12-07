sudo apt install docker.io

sudo docker run -p 80:80 --name the-nginx -d nginx

# haproxy dockerimage which binds port 80 (loadbalancer) to 79 (app)
cd haproxy

sudo docker build -t my-haproxy .

sudo docker login
sudo docker tag my-haproxy mateuszlewko/ii-uwr-cloud-haproxy 
sudo docker push docker.io/mateuszlewko/ii-uwr-cloud-haproxy:latest