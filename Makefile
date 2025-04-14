.PHONY: build-training build-serving train serve clean

build-training:
	docker build -t model-training:latest -f docker/training/Dockerfile .

build-serving:
	docker build -t model-serving:latest -f docker/serving/Dockerfile .

train:
	docker run --rm -v models:/app/models model-training:latest

serve:
	docker run --rm -p 8080:8080 model-serving:latest

clean:
	docker system prune -f
