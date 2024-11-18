create-cluster:
	kind create cluster --name envoy-test
envoy-config:
	gomplate -f gomplate/envoy-cm.tmpl -o envoy-cm.yaml
deploy-certs-cm:
	kubectl apply -f certs-cm.yaml
deploy-envoy-cm:
	kubectl apply -f envoy-cm.yaml
deploy: deploy-certs-cm deploy-envoy-cm
	kubectl apply -f deployment.yaml
clean-up:
	kind delete cluster --name envoy-test