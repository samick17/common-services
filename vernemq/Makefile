run:
	sh launch.sh

reconf:
	docker exec -it vernemq1 sed -i 's/vmq_diversity.auth_redis.enabled = off/vmq_diversity.auth_redis.enabled = on/g' /etc/vernemq/vernemq.conf
# 	docker exec -it vernemq1 sed -i 's/plugins.vmq_diversity = off/plugins.vmq_diversity = on/g' /etc/vernemq/vernemq.conf
# 	docker exec -it vernemq1 sed -i 's/vmq_diversity.auth_redis.enabled = off/vmq_diversity.auth_redis.enabled = on/g' /etc/vernemq/vernemq.conf
# 	docker exec -it vernemq1 sed -i 's/## vmq_diversity.redis.host = localhost/vmq_diversity.redis.host = redis/g' /etc/vernemq/vernemq.conf
# 	docker exec -it vernemq1 sed -i 's/## vmq_diversity.redis.port = 6379/vmq_diversity.redis.port = 6379/g' /etc/vernemq/vernemq.conf

showconf:
	docker exec -it vernemq1 cat /etc/vernemq/vernemq.conf | grep vmq_diversity

clean:
	docker stop vernemq1
	docker rm vernemq1

showplugin:
	docker exec -it vernemq1 vmq-admin plugin show

all:
	make run
	make reconf

genpw:
	echo -n $(pw) | bcrypt --cost=12

adduser:
	sh adduser.sh

sub:
	mosquitto_sub --host localhost --port 1883 --topic /asd --username samick --pw abcd1234

pub:
	mosquitto_pub --host localhost --port 1883 --topic /asd --username samick --pw abcd1234 --message "asd"

