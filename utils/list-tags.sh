#!/bin/bash
git fetch --tags
git tag --sort=-creatordate -n1 