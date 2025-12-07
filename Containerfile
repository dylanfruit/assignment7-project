RUN dnf update -y && install -y httpd
RUN echo "Containers are easy!" > /var/www/html/index.html
RUN useradd collin
RUN mkdir /structure && chmod 777 /structure

USER sync
RUN mkdir /structure/sync-work

USER nobody 
RUN mkdir /structure/nobody-work

USER root
EXPOSE 80
ENTRYPOINT /usr/sbin/httpd -DFOREGROUND