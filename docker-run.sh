docker run --user $(id -u):$(id -g) --rm -it --hostname great-expectations --name great-expectations --network host -v $(pwd)/container:/code mardambey/great-expectations:latest bash
