# Create a `GNUmakefile` in a subdir of here containing:
#
#    STACK=stackname
#    include ../stack.mk


STACKYAML?=stack.yml

# If building a private (un-registered) image (using build), add: --with-registry-auth
#STACKOPTS?=--with-registry-auth
STACKOPTS?=

DOCKERRUNOPTS?=

start:
	docker stack deploy $(STACK) $(STACKOPTS) --compose-file=$(STACKYAML)

stop:
	docker stack rm $(STACK)

watch:
	docker service logs $(STACK)_$(STACK) -f

build:
	docker build . -t $(STACK)

run:
	docker run -d $(DOCKERRUNOPTS) $(STACK)

debug:
	docker run -it $(DOCKERRUNOPTS) $(STACK) bash
