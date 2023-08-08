#!/bin/bash

ORB_VAL_REGISTRY_URL="$(circleci env subst "$ORB_VAL_REGISTRY_URL")"
ORB_VAL_IMAGE="$(circleci env subst "$ORB_VAL_IMAGE")"

SOURCE_TAG=$(eval echo "$ORB_EVAL_SOURCE_TAG")
TARGET_TAG=$(eval echo "$ORB_EVAL_TARGET_TAG")

IMAGE_ROOT="$ORB_VAL_REGISTRY_URL/${!ORB_ENV_PROJECT_ID}/$ORB_VAL_IMAGE"
gcloud container images add-tag --quiet \
    "$IMAGE_ROOT:$SOURCE_TAG" \
    "$IMAGE_ROOT:$TARGET_TAG"
