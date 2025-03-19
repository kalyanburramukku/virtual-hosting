FROM nginx:latest
# create  sites-available and sites-enabled directories
RUN mkdir /etc/nginx/sites-available
RUN mkdir /etc/nginx/sites-enabled
# create vhosts html folders
RUN mkdir -p /var/www/domain1/public_html
RUN mkdir -p /var/www/domain2/public_html
# copy config files
COPY nginx.conf /etc/nginx/nginx.conf
COPY domain1.conf /etc/nginx/sites-available/domain1.conf
COPY domain2.conf /etc/nginx/sites-available/domain2.conf
# create sym links
RUN ln -s /etc/nginx/sites-available/domain1.conf /etc/nginx/sites-enabled/domain1.conf
RUN ln -s /etc/nginx/sites-available/domain2.conf /etc/nginx/sites-enabled/domain2.conf
# copy build code from source to html  directories
COPY domain1/src/. /var/www/domain1/public_html
COPY domain2/src/. /var/www/domain2/public_html