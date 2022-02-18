# Load Testing Infrastructure

## Introduction

The purpose of this repository is to demonstrate the two different approaches of
standing up a scalable infrastructure running a distributed Apache JMeter based load
tests orchestrated with a CircleCI pipeline.

## Approaches

### Container based JMeter Load Tests

This approach leverages Apache JMeter as an open source load and performance testing
tool and uses Terraform to dynamically provision required infrastructure, run load
tests and tear down the infrastructure.

The pipeline includes two workflows

- One workflow `build_jmeter_docker_image`, builds a custom JMeter Docker container
and pushes the image to Azure Container Registry (ACR).

- Workflow `build_deploy_loadtest`, dynamically provisions load testing
infrastructure. The load test is then run, and test results are published. The
provisions infrastructure is destroyed after the run is complete.

The testing pipeline consists of the following steps -

- creates infrastructure on-demand
- deploys the infrastructure
- executes load tests
- reports test results
- destroys infrastructure on-demand

![CircleCI Pipeline](images/load-testing.png)

## Getting Started

1. Clone the GitHub repository to get started by connecting to your CircleCI account
and `.circleci/config.yml`.

1. [Create a Service Principal](https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object). Gather Client ID, Client Secret and Azure Service Connection Name for adding them
to Environment Variables list.

1. Create Environment Variables in the CircleCI Project settings.

    1. ARM_CLIENT_ID - Application/Client ID of the
    1. ARM_CLIENT_SECRET
    1. ARM_SUBSCRIPTION_ID
    1. ARM_TENANT_ID
    1. DOCKER_PASS
    1. DOCKER_USERNAME
    1. JMETER_DOCKER_IMAGE
    1. LOCATION
