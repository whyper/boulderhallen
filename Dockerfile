FROM ubuntu:18.04 AS puppeteer
ENV TZ=Europe/Berlin

RUN apt -y update
RUN apt-get -y install iputils-ping curl vim libgtk2.0-0 gconf-service libxext6 \
  libxfixes3 libxi6 libxrandr2 libxrender1 libcairo2 libcups2 libdbus-1-3 libexpat1 \
  libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 \
  libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 \
  libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxss1 libxtst6 libappindicator1 \
  libnss3 libasound2 libatk1.0-0 libc6 ca-certificates fonts-liberation lsb-release \
  xdg-utils wget apt-transport-https software-properties-common  adduser libfontconfig1 \
  libgbm-dev dialog apt-utils -y

# Install Node, NPM and Puppeteer
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt install -y nodejs
RUN useradd -m -p password pi
RUN su - pi -c "npm init -y && npm install puppeteer"

RUN apt-get install -y netcat

COPY test* /home/pi/

#RUN echo "0,5,10,15,20,25,30,35,40,45,50,55 8-23 * * * su - pi -c \"cd /home/pi && /home/pi/test_capacity.sh\"" > mycron &&  \
#    crontab mycron && rm mycron
#RUN update-rc.d cron defaults

#CMD /bin/bash -c "ping 127.0.0.1"
CMD su - pi -c "cd /home/pi && /home/pi/test_capacity.sh"
