
echo -e "Distributed web crawler admin platform for spiders management regardless of languages and frameworks."
git clone https://github.com/crawlab-team/crawlab.git

echo -e "Golang-based distributed web crawler management platform, supporting various languages including Python, NodeJS, Go, Java, PHP and various web crawler frameworks including Scrapy, Puppeteer, Selenium."

git clone https://github.com/crawlab-team/examples
cd examples/docker/basic
docker-compose up -d



Docker-Compose

version: '3.3'
services:
  master: 
    image: crawlabteam/crawlab:latest
    container_name: crawlab_example_master
    environment:
      CRAWLAB_NODE_MASTER: "Y"
      CRAWLAB_MONGO_HOST: "mongo"
    volumes:
      - "./.crawlab/master:/root/.crawlab"
    ports:    
      - "8080:8080"
    depends_on:
      - mongo

  worker01: 
    image: crawlabteam/crawlab:latest
    container_name: crawlab_example_worker01
    environment:
      CRAWLAB_NODE_MASTER: "N"
      CRAWLAB_GRPC_ADDRESS: "master"
      CRAWLAB_FS_FILER_URL: "http://master:8080/api/filer"
    volumes:
      - "./.crawlab/worker01:/root/.crawlab"
    depends_on:
      - master

  worker02: 
    image: crawlabteam/crawlab:latest
    container_name: crawlab_example_worker02
    environment:
      CRAWLAB_NODE_MASTER: "N"
      CRAWLAB_GRPC_ADDRESS: "master"
      CRAWLAB_FS_FILER_URL: "http://master:8080/api/filer"
    volumes:
      - "./.crawlab/worker02:/root/.crawlab"
    depends_on:
      - master

  mongo:
    image: mongo:4.2
    container_name: crawlab_example_mongo
    restart: always



xdg-open https://github.com/crawlab-team/crawlab
