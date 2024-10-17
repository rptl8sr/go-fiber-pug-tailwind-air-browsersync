# VARIABLES
PACKAGES := $(shell go list ./...)
PROJECT := $(shell basename ${PWD})
LOCAL_BIN := $(CURDIR)/bin
USER := rptl8sr
EMAIL := $(USER)@gmail.com


# GITHUB
.PHONY: git-init
git-init:
	gh repo create $(PROJECT) --private
	git init
	git config user.name "$(USER)"
	git config user.email "$(EMAIL)"
	git add Makefile go.mod
	git commit -m "Init commit"
	git remote add origin git@github.com:$(USER)/$(PROJECT).git
	git remote -v
	git push -u origin master


BN ?= dev
# make git-checkout BN=dev
.PHONY: git-checkout
git-checkout:
	git checkout -b $(BN)

# BUILDING
.PHONY: build
build: test build-app build-css


.PHONY: test
test:
	go test -race -cover $(PACKAGES)


.PHONY: build-app
build-app:
	go build -o ./tmp/main -v .


.PHONY: build-css
build-css:
	npm --prefix front run build-css



# WATCHING
.PHONY: watch
watch:
	$(MAKE) build
	$(MAKE) -j3 watch-app watch-css watch-browser


.PHONY: watch-app
watch-app:
	air


.PHONY: watch-css
watch-css:
	npm --prefix front run watch-css


.PHONY: watch-browser
watch-browser:
	npm --prefix front run watch-browser
