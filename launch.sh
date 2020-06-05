apt-get update
apt-get install -y curl apt-transport-https ca-certificates software-properties-common
apt install -y docker.io
apt install -y docker-compose

cd /boulderhallen
docker-compose build
docker-compose up -d

echo "0,5,10,15,20,25,30,35,40,45,50,55 8-23 * * * cd /boulderhallen && docker-compose up puppeteer" > mycron
crontab mycron && rm mycron
