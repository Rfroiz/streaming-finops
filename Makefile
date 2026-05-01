.PHONY: help up down logs ps clean smoke-test

help:
	@echo "make up           - start the stack (Kafka + Schema Registry)"
	@echo "make down         - stop the stack"
	@echo "make logs         - tail logs from all services"
	@echo "make ps           - show running containers"
	@echo "make clean        - stop and remove volumes (wipes Kafka data)"
	@echo "make smoke-test   - create test topic, produce + consume one message"

up:
	docker compose up -d
	@echo ""
	@echo "Stack is starting. Endpoints:"
	@echo "  Kafka broker:    localhost:9092"
	@echo "  Schema Registry: http://localhost:8085"
	@echo ""
	@echo "Run 'make ps' to check health."

down:
	docker compose down

logs:
	docker compose logs -f --tail=100

ps:
	docker compose ps

clean:
	docker compose down -v
	@echo "All volumes removed."

smoke-test:
	@echo "Creating topic 'smoke-test'..."
	docker compose exec broker kafka-topics --bootstrap-server broker:29092 \
		--create --if-not-exists --topic smoke-test --partitions 3 --replication-factor 1
	@echo ""
	@echo "Listing topics..."
	docker compose exec broker kafka-topics --bootstrap-server broker:29092 --list
	@echo ""
	@echo "Producing one message via kcat..."
	@echo "hello-streamcost-$$(date +%s)" | kcat -b localhost:9092 -t smoke-test -P
	@echo ""
	@echo "Consuming (timeout 5s)..."
	kcat -b localhost:9092 -t smoke-test -C -e -q -o beginning
	@echo ""
	@echo "Smoke test passed."
