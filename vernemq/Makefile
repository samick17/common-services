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

showwebhooks:
	docker exec -it vernemq1 cat /etc/vernemq/vernemq.conf | grep vmq_webhooks

clean:
	docker stop vernemq1
	docker rm vernemq1

showplugin:
	docker exec -it vernemq1 vmq-admin plugin show

all:
	make run
# 	make updatelua
# 	make reconf

genpw:
	echo -n $(pw) | bcrypt --cost=12

adduser:
	sh adduser.sh samick abcd1234
	sh adduser.sh testuser abcd1234

updatelua:
	docker cp ./auth/redis.lua vernemq1:/vernemq/share/lua/auth/redis.lua
	docker exec -it vernemq1 vmq-admin script reload path=./share/lua/auth/redis.lua

sub:
	mosquitto_sub --host localhost --port 1883 --topic test/abcde --username samick --pw abcd1234

pub:
	mosquitto_pub --host localhost --port 1883 --topic test/abcde --username testuser --pw abcd1234 --message "asd"

log:
	docker logs vernemq1

reg_hooks:
	docker exec -it vernemq1 vmq-admin webhooks register hook=auth_on_publish endpoint="http://localhost/pub"

show_hooks:
	docker exec -it vernemq1 vmq-admin webhooks show

launch_cluster_auto:
	echo TODO
