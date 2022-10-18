# Docker Helper Scripts

This gist contains various helper scripts for microservice development. The scripts depend on the following utilities.

- [jq](https://stedolan.github.io/jq/)
- [gcloud](https://cloud.google.com/sdk/gcloud)
- [Docker](https://www.docker.com/)

## Contents

- [Scripts]()
  - [build-container.sh]()
  - [push-container.sh]()
- [Adding to your repo]()

## Scripts

### build-container.sh

#### Description

Use this script to build and optinally tag a docker container for a microservice. This script is intended to be used with Node microservices as it reads a semver from a package.json file.

#### Usage

```text
$ ./build-container [--tag {$SERVICE_NAME}] [--inc-major {false}] [--inc-minor {false}] [--inc-patch {false}]

where:
  [--tag]       Optional: The tag you'd like to use for this service.
                Defaults to $SERVICE_NAME.

  [--inc-major] Optional: Increment semver major. Will update package.json as a result.
                Will downgrade minor and patch to 0.  E.g., 1.1.1 => 2.0.0.
                Defaults to false.
  
  [--inc-minor] Optional: Increment semver minor. Will update package.json as a result.
                Will downgrade patch to 0.  E.g., 2.1.1 => 2.2.0.
                Defaults to false.
                
  [--inc-patch] Optional: Increment semver patch. Will update package.json as a result.
                E.g., 1.0.0 => 1.0.1.
                Defaults to false.
```

### push-container.sh

#### Description

Use this script to push a tagged docker container to GCP Artifact Registry.

#### Usage

```text
$ ./push-container --region <REGION> [--project {project}] [--registry {gfc-artifacts}] [--tag {$SERVICE_NAME}] [--inc-major {false}] [--inc-minor {false}] [--inc-patch {false}]

where:
  --region      Required: The GCP region hosting the artifact registry repository you'd like to push this image to.
                E.g., us-west1.
  
  [--project]   Optional: The name of the GCP project this container belongs to.
                If not provided the script will attempt to load the default project from gcloud.
                If not provided and no default project is found the script exits with an error.
                
  [--registry]  Optional: The name of the artifact registry repository you'd like to push this image to.
                Defaults to gcf-artifacts.
  
  [--tag]       Optional: The tag you'd like to use for this service.
                Defaults to $SERVICE_NAME.

  [--inc-major] Optional: Increment semver major. Will update package.json as a result.
                Will downgrade minor and patch to 0.  E.g., 1.1.1 => 2.0.0.
                Defaults to false.
  
  [--inc-minor] Optional: Increment semver minor. Will update package.json as a result.
                Will downgrade patch to 0.  E.g., 2.1.1 => 2.2.0.
                Defaults to false.
                
  [--inc-patch] Optional: Increment semver patch. Will update package.json as a result.
                E.g., 1.0.0 => 1.0.1.
                Defaults to false.
```

## Adding to your repo

Change into the directory where you want the scripts to live.

```sh
$ cd ~/code/[SERVICE_NAME]
```

Run the download script (replacing [SERVICE-NAME] with the name of your micro service).

```sh
$ bash <(curl -sL [###_CHANGE_ME_###]) [SERVICE-NAME]
```