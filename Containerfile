FROM quay.io/fedora/fedora
WORKDIR /app

RUN  curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl && chmod a+x /usr/local/bin/kubectl

ADD app/* /app/
ENTRYPOINT /app/main
