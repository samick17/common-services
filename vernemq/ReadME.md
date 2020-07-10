## [Environment Variables]
 - DOCKER_VERNEMQ_ACCEPT_EULA yes
 - DOCKER_VERNEMQ_ALLOW_ANONYMOUS on | off

## [Port mapping]
 - 1883	1883	tcp
 - 8080	8080	tcp
 - 8888	8888	tcp
 - 44053	44053	tcp

## [Security Group]

 - 1883
 - 8080
 - 8888
 - 44053
 - 9100 - 9109

## [Clustering]

```sh
vmq-admin cluster join discovery-node=VerneMQ@172.31.10.133
```

## [ACL - file]

```sh
# vmq-passwd -c /etc/vernemq/vmq.passwd $NAME
vmq-passwd -c /etc/vernemq/vmq.passwd vsssi
```


## [Benchmark testing]

```sh
go get github.com/tranvietanh1991/mqtt-benchmark
sudo ln /go/bin/mqtt-benchmark /usr/bin/mqtt-benchmark
VMQ_USERNAME=vsssi
VMQ_PASSWORD=ssi1234
VMQ_BROKER_URL=mvb-vmq-lb-1646000923.ap-south-1.elb.amazonaws.com:1883
mqtt-benchmark --broker mvb-vmq-lb-1646000923.ap-south-1.elb.amazonaws.com:1883 -username vsssi -password ssi1234 -clients 30000 -count 10 -size 11024 -qos 1 -delay 1  -msgtimeout 1000


VMQ_BROKER_URL=wss://w-mqtt.stage.myviewboard.cloud/stage
mqtt-benchmark --broker "wss://w-mqtt.stage.myviewboard.cloud/stage" -username vsssi -password ssi1234 -clients 30000 -count 10 -size 11024 -qos 1 -delay 1  -msgtimeout 1000

```


```sh
mqtt-benchmark --broker mvb-vmq-lb-1646000923.ap-south-1.elb.amazonaws.com:1883 -username vsssi -password ssi1234 -clients 3000 -count 10 -size 11024 -qos 1 -delay 1  -msgtimeout 1000

mqtt-benchmark --broker "wss://w-mqtt.stage.myviewboard.cloud/stage" -username vsssi -password ssi1234 -clients 3000 -count 10 -size 11024 -qos 1 -delay 1  -msgtimeout 1000

```
