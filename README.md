# docker-archlinux-hugo [![Build Status](https://drone.dotya.ml/api/badges/wanderer/docker-archlinux-hugo/status.svg?ref=refs/heads/master)](https://drone.dotya.ml/wanderer/docker-archlinux-hugo)

This repository provides the Dockerfile to create a Docker image used for web developent using [Hugo](https://gohugo.io) website building framework.
The image is rebuilt approximately every hour to ensure it always has the latest packages.

## What you get
* updated Arch Linux [base image](https://hub.docker.com/_/archlinux)
* wget
* tar
* git
* hugo-extended (latest version from [GitHub](https://github.com/gohugoio/hugo/releases))

## Purpose
* web development using `Hugo` upon fresh package base
