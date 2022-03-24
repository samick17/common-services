FROM samick/robot_env

WORKDIR /app

EXPOSE 9515

CMD ["./chromedriver", "--allowed-ips=127.0.0.1,::ffff:ac11:1"]
