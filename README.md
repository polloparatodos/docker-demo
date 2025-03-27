# CI/CD Dockerfile Demo

In this demo, you will modify the Dockerfile to practice working with building images using the Dockerfile standard format.

## Prerequisites

While no familiarity with Docker is expected, it would be helpful to understand the basics of Docker and the Dockerfile syntax. Please consider reading the official documentation:

* [Docker](https://docs.docker.com/)
* [Reference documentation](https://docs.docker.com/reference/)
* [Dockerfile reference](https://docs.docker.com/reference/dockerfile/)

You are encouraged to fork this repo and make these changes in your own github repo, once you've gone through the steps, you'll see a step to submit a PR into this repository with your changes.

If you run into any issues, please reach out to Ryan or Jaired.

## Demo

This demo is meant to cover the following objectives:

### Create a Dockerfile and subsequently build an image from it

1. Begin by reading over the [Dockerfile.sample](./Dockerfile.sample) file to get familiar with what is supported by this demo.
2. Create a new file named `Dockerfile` in the root of this project
3. Add options you found in `Dockerfile.sample`
   * Note: You do not have to use all of the instructions found within the `Dockerfile.sample` file. We recommend adding different instructions, running the build command below, and seeing what results are found.
4. Once you've added the instructions you want to try out, run the following command: `docker build --file Dockerfile . --no-cache`
   * The flags specified above for `docker build` are as follows:
     * Path to Dockerfile: `--file Dockerfile`
     * Directory to build from: `.`
     * Disable docker build cache, helpful if you need to build from scratch every time: `--no-cache`

### Run a docker container from the created docker image:

Note: There are MANY ways to go about building and running a container, so we will only cover a short set of steps. Please read over the documentation below for more information:

* [Docker Build Documentation](https://docs.docker.com/get-started/docker-concepts/building-images/build-tag-and-publish-an-image/)

1. In the output above, you will find a line similar to the following:
> writing image sha256:9924dfd9350407b3df01d1a0e1033b1e543523ce7d5d5e2c83a724480ebe8f00
2. Copy that sha256:<image id> and use the following command to run your container:
`docker run sha256:9924dfd9350407b3df01d1a0e1033b1e543523ce7d5d5e2c83a724480ebe8f00` (replace the image ID with the ID from your output)

### Use GitHub Actions to run the build and run commands

1. Modify the `.github/workflows/docker.yml` file and change the build command to whatever you ended up using. You are encouraged to try and break and subsequently fix the issue so you can see how GitHub Actions work!
2. Once you've played with how the build command works, try and add a run or exec command as well
3. Push your changes to your remote and trigger the github workflow by going to Actions &#8594; 'Docker Image CI' &#8594; Run workflow
4. Modify the Actions workflow file and add a new event on a line above or below `workflow_dispatch` named `push:`
   * Your change should look like the following:
   ```
   on:
     workflow_dispatch:
     push:
   ```
5. Once you're happy with your changes, submit a PR to the parent repo from your fork with a Dockerfile in the following format: `Dockerfile-githubusername`

## Troubleshooting

If you are on Mac, you may run into an error similar to the following:

`error getting credentials - err: exec: "docker-credential-osxkeychain": executable file not found in $PATH, out:`

To fix this, you may need to install the following brew package:

`brew install docker-credential-helper`

See https://github.com/docker/for-mac/issues/2131
