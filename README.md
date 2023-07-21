# ovos-image-arch-recipe
_____________

### Forked for Fedora 38 / podman
_____________



First, create the Docker container:
```shell
$ podman build . -t ovos-image-builder
```

Then, run the container to create a OVOS Image. Set `CORE_REF` to the branch of
`ovos-core` that you want to build and `RECIPE_REF` to the branch of `ovos-image-recipe`
you want to use. Set `MAKE_THREADS` to the number of threads to use for `make` processes.
Set `BUILD_TYPE` for hardware target.

Manjaro arch image recipe has support for building images for two different hardware targets.

Respeaker Hardware Target:

``` shell
podman run --privileged \
-v $pwd/output/:/output:rw \
-v /run/systemd/resolve:/run/systemd/resolve \
-e CORE_REF=${CORE_REF:-dev} \
-e RECIPE_REF=${RECIPE_REF:-master} \
-e MAKE_THREADS=${MAKE_THREADS:-4} \
-e BUILD_TYPE=respeaker \
--network=host \
--name=ovos-image-builder \
ovos-image-builder
```
