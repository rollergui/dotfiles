#!/bin/bash

install_docker () {
    sudo apt update
    sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    if apt-cache policy docker-ce | grep -q download.docker.com; then
        sudo apt install docker-ce
        sudo systemctl status docker
    else
        echo "Candidate is not from Docker repo. Exiting..."
        exit 0
    fi
}

add_user_to_docker_group () {
    sudo usermod -aG docker ${USER}
    su - ${USER}
    if groups | grep -q ${USER}; then
        echo "User added to docker group"
        exit 0
    fi
}

install_docker
add_user_to_docker_group