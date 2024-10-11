sudo apt-get update -y
sudo apt-get install -y docker.io

sudo systemctl start docker
sudo systemctl enable docker

docker pull --platform linux/amd64

sudo docker run -d -p 80:80 docker/getting-started