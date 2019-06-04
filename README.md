# Containers owner example

An example of running a container with non-root user and mounting volume in a way it can write to it.

## Usage:

Build:

```
podman build -t container-owner-example .
```

Check it works:

```
$ podman run --uidmap 1001:0:1 --uidmap 0:1:1001 -v $(readlink -f shared):/shared --rm -ti container-owner-example ls -al /shared
drwxr-xr-x.  2 testuser testuser 4096 Jun  7 14:16 .
drwxr-xr-x. 20 root     root     4096 Jun  7 14:22 ..
-rw-r--r--.  1 testuser testuser   21 Jun  7 14:16 ahoj
-rw-r--r--.  1 testuser testuser    6 Jun  7 14:16 ahoj2
-rw-r--r--.  1 testuser testuser    4 Jun  7 14:16 ahoj3
```
