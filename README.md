# Load Testing Infrastructure

## Introduction

The purpose of this repository is to demonstrate the two different approaches of standing up a scalable
infrastructure running a distributed Apache JMeter based load tests orchestrated with a CircleCI pipeline.

## Approaches

### Container based JMeter Tests

This approach leverages Apache JMeter as an open source load and performance testing tool and uses Terraform to dynamically provision and destroy the required infrastrucure.

The testing pipeline

- creates infrastructure on-demand
- deploys the infrastructure
- executes testing
- reports test results
- destroys infrastructure on-demand

The pipeline includes two workflows

- One workflow `build_jmeter_docker_image`, builds a custom JMeter Docker container and pushes the image to Azure Container Registry (ACR).

- Workflow `build_deploy_loadtest`, dynamically provisions load testing infrastructure. The load test is then run, and test results are published. The provisions infrastructure is destroyed after the run is complete.

