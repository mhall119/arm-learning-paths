---
# User change
title: "About Redis deployment configurations"

weight: 2 # 1 is first, 2 is second, etc.

# Do not modify these elements
layout: "learningpathall"
---

##  About Redis deployment configurations

###  Introduction to Redis
Redis, which stands for Remote Dictionary Server, is an open source, in-memory, key-value data store. Redis has a variety of data types, including bitmaps, hyperloglogs, geographic indexes, streams, lists, sets, and sorted sets with range queries.

### Configuring Redis Server
We can configure the Redis server using the [redis.conf](https://redis.io/docs/management/config-file/) file. Alternatively, we can configure Redis servers by [passing arguments via the command line](https://redis.io/docs/management/config/#passing-arguments-via-the-command-line) when fewer configuration variables need to be set.

### Single node configuration
After installing Redis, by default it runs on localhost (`127.0.0.1`) at port **6379**. Hence, port **6379** becomes unavailable for binding with the public IP of the remote server. Thus, we set the bind configuration option in the **redis.conf** file to `0.0.0.0`.

For a single-node Redis server, we need to set the following in the **redis.conf** file:
```console
bind 0.0.0.0
port 6379
protected-mode yes
cluster-enabled no
daemonize yes
appendonly no
```

To connect to the remote Redis server, we need to use Redis Client (`redis-cli`) with:
- **-h** option providing hostname
- **-p** option providing the port number  

### Multi-node configuration
A Redis multi-node cluster requires 3 primary and 3 replica nodes in a minimal configuration to work properly.  

We can use 6 different ports of the same host as follows:
```console
redis-cli --cluster create HOST:port1 HOST:port2 HOST:port3 HOST:port4 HOST:port5 HOST:port6
```

Alternatively, we can create 6 different hosts with Redis server running on same port as follows:
```console
redis-cli --cluster create HOST1:port HOST2:port HOST3:port HOST4:port HOST5:port HOST6:port
```
Here, we are using the second approach, in which we need to create 6 different hosts with Redis server running on **6379** port.

Here is the minimal template of **redis.conf** file.
```console
bind 0.0.0.0
protected-mode no
port 6379
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
daemonize yes
appendonly yes
```

To connect to the remote Redis multi-node cluster, we need to use Redis Client (`redis-cli`) with:
- **-c** option to enable cluster mode
- **-h** option providing hostname
- **-p** option providing the port number.

