# Base Ubuntu Server Configurations

## Test configuration in Docker

```shell
docker rmi 'pi3bdots-test' &>/dev/null; docker build  --progress 'plain' -t 'pi3bdots-test' -f 'tests/Dockerfile' . && docker run -ti --rm pi3bdots-test
```
