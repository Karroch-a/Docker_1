#bin/bash
docker build -t react .
docker run -it -p 3000:3000 react
