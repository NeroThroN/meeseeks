.SILENT: # Used to avoid showing the commands executed
.DEFAULT_GOAL: init # Set the default goal to init

########################################
#          INITIALIZE PROJECT          #
########################################

.PHONY: init
init: # Initialize the project by getting the dependencies
	make -s get

.PHONY: reset
reset: # Reset the project by cleaning the project and initializing it
	make -s clean
	make -s init

#################################
#          PUB RELATED          #
#################################

.PHONY: get
get: # Get the dependencies for the project
	flutter pub get

.PHONY: outdated
outdated: # Check for outdated flutter packages
	flutter pub outdated

##############################
#          CLEANING          #
##############################

.PHONY: clean
clean: # Clean the flutter cache
	flutter clean

####################################
#          BUILD / DEPLOY          #
####################################

.PHONY: linux
linux: # Build the app for linux platform
	flutter build linux

.PHONY: android
android: # Build the app for android platform
	flutter build apk

.PHONY: web
web: # Build the app for web platform
	flutter build web

.PHONY: all
all: # Build the app for all supported platforms (linux, Android, web)
	make -s reset
	make -s linux
	make -s android
	make -s web

##########################
#          HELP          #
##########################

.PHONY: help
help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done