.PHONY: proto envoy-proto

# ==============================================================================
# Generate proto

proto:
	@echo "Generating gRPC code..."
	protoc --go_out=. --go-grpc_out=. /*.proto


# ==============================================================================
# Generate proto for Envoy

PROTO_DIR := ./proto
ENVOY_DIR := ./envoy
DESCRIPTOR := $(ENVOY_DIR)/service.pb

PROTO_FILES := $(PROTO_DIR)/hello.proto \
               $(PROTO_DIR)/search.proto \
               $(PROTO_DIR)/vacancy.proto

envoy-proto:
	@echo "Generating service.pb for Envoy..."
	protoc -I$(PROTO_DIR) -I$(PROTO_DIR)/googleapis --include_imports --include_source_info --descriptor_set_out=$(DESCRIPTOR) $(PROTO_FILES)
	@echo "Ready: $(DESCRIPTOR)"
