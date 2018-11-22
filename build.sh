#!/bin/bash

repo=ceymard/postgrest-nginx-node
tag=$1

if [ ! "$tag" ]; then
	echo 'Please provide a tag'
	exit 1
fi

docker build --rm -t "$repo:$tag" .
if [ "$UPLOAD" != "" ]; then
	gcloud docker -a
	docker push "$repo:$tag"
fi
