kubeconfig:
	gcloud container clusters get-credentials api-cluster --zone northamerica-northeast1-a --project qubichubdev-adriano

deploy: push
	kubectl apply -f my-k8s-setup.yaml

destroy:
	kubectl delete -f my-k8s-setup.yaml

push: tag
	docker push gcr.io/qubichubdev-adriano/my-sample-image

tag: build
	docker tag image-for-k8s:laptop_build gcr.io/qubichubdev-adriano/my-sample-image

build:
	GOOS=linux GOARCH=amd64 go build -o simple-infinite-loop
	docker build -t image-for-k8s:laptop_build .
