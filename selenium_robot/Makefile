MAKEFLAGS += --silent

build_env:
	docker build -f env.Dockerfile . -t samick/robot_env

build_runner:
	docker build -f runner.Dockerfile . -t samick/autom_runner

launch_runner:
	docker run -p 9515:9515 -it samick/autom_runner
