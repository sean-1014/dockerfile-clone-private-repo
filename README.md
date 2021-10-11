# Cloning Private Repos in a Dockerfile

The method used in this project requires an SSH key associated with the Github account to be used to clone a private repository. Since this method uses the Docker [Buildkit](https://github.com/moby/buildkit), Docker 18.09 or higher is required.

Steps:
1. [Set up an SSH key for your Github account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
2. Add the SSH key to the `ssh-agent`. If key is password protected, this will prompt you for your password once so you can use the key without being prompted each time for as long as the `ssh-agent` is running.
```bash
$ eval $(ssh-agent)
Agent pid 7267
$ ssh-add /path/to/private_key
```
3. Build your image using the following command:
```bash
DOCKER_BUILDKIT=1 docker build --ssh default .
```
