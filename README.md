# docker-archlinux-hugo

[![Build Status](https://drone.dotya.ml/api/badges/wanderer/docker-archlinux-hugo/status.svg?ref=refs/heads/master)](https://drone.dotya.ml/wanderer/docker-archlinux-hugo)

This repository provides a Containerfile to create a container image used for web developent using [Hugo](https://gohugo.io) website building framework.

## :warning: :construction: DockerHub issue :construction: :warning:
unless you're running Arch (or a Fedora 34+ or some reasonably recent thing) as your host OS, please make sure you read through the following issue write-up (since DH issue affects the base image it affects this one, too) \
⇒ https://git.dotya.ml/wanderer/docker-archlinux/issues/1 \
:warning: :construction: :construction: :construction: :warning:

The image is rebuilt <del>approximately every hour</del> nightly to ensure it always has the latest packages.

push mirror lives in [this GitHub repo](https://github.com/wULLSnpAXbWZGYDYyhWTKKspEQoaYxXyhoisqHf/docker-archlinux-hugo)  
development happens on [this Gitea instance](https://git.dotya.ml/wanderer/docker-archlinux-hugo)

## What you get
* updated Arch Linux [image](https://hub.docker.com/r/immawanderer/archlinux) based on [base image](https://hub.docker.com/_/archlinux)
* git
* hugo-extended (latest version from [GitHub](https://github.com/gohugoio/hugo/releases))

## Purpose
* web development using `Hugo` upon fresh package base
