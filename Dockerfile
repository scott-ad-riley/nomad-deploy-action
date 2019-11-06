FROM vancluever/nomad

WORKDIR /nomad-deploy
COPY deploy /nomad-deploy/my_script
COPY . /nomad-deploy

ENTRYPOINT ["/app/my_script"]
