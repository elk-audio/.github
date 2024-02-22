# Elk Docker Build, Cache and Publish

## TODO: 

CACHE

## Example

```
      - name: Build image and push to ECR
        uses: elk-audio/github-ci-experiments/.github/actions/elk-docker-build-cache-push@main
        with:
          image-name: "test-elk-docker-build-cache-push"
          context: "./test-elk-docker-build-cache-push"
```

## Extra Info:

* https://docs.docker.com/build/cache/backends/s3/
* https://docs.docker.com/build/drivers/
* https://docs.docker.com/build/drivers/kubernetes/
* https://github.com/docker/build-push-action
* https://github.com/docker/setup-buildx-action
* https://github.com/orgs/community/discussions/18549
