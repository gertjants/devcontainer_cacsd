# Development container

Development container that can be used with VSCode. All relevant extensions and packages for the course have already been installed.

It works on Linux, Windows and OSX.

## Requirements

- [VS code](https://code.visualstudio.com/download) installed
- [VS code remote containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) installed
- [Docker](https://www.docker.com/products/docker-desktop) installed and running
- [Docker Compose](https://docs.docker.com/compose/install/) installed

## Setup
1. **For Docker on OSX or Windows without WSL**: ensure your home directory `~` is accessible by Docker.
2. **For Docker on Windows without WSL:** if you want to use SSH keys, bind mount your host `~/.ssh` to `/tmp/.ssh` instead of `~/.ssh` by changing the `volumes` section in the [docker-compose.yml](docker-compose.yml).
3. Open the command palette in Visual Studio Code (CTRL+SHIFT+P).
4. Select `Remote-Containers: Open Folder in Container...` and choose the project directory.

To rebuild the image, either:

- With VSCode through the command palette, select `Remote-Containers: Rebuild and reopen in container`
- With a terminal, go to this directory and `docker-compose build`

### Customize VS code settings

You can customize **settings** and **extensions** in the [devcontainer.json](devcontainer.json) definition file.