FROM node:10

# Install utilities
RUN apt-get update --fix-missing && apt-get -y upgrade
RUN apt-get install zip

# Install latest chrome stable package.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update
RUN apt-get install -y google-chrome-stable --no-install-recommends

# Install Lighthouse CI
RUN npm install -g @lhci/cli@0.3.9
RUN npm install -g lighthouse
