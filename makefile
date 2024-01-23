# ./Makefile

# ##################
# VARIABLES
# ##################

# working direcotry 
WORK_DIR := build
WORK_PATH := $(CURDIR)/$(WORK_DIR)

# environment variable aimed to be overloaded;
# default target to fixed path of common .env file
ENV_FILE ?= $(WORK_PATH)/.env 

# transform given relative path of ENV_FILE variable to fixed path;
# check if ENV_PATH is empty 
ENV_PATH := $(wildcard $(realpath $(ENV_FILE)))
ifndef ENV_PATH
  $(error Provided file does not exist: $(ENV_FILE));
  exit 1
endif

# docker compose 
COMPOSE_EXE := docker compose
COMPOSE_FILE := compose.yml
COMPOSE_PATH := $(WORK_PATH)/$(COMPOSE_FILE)
COMPOSE_CMD := ENV_FILE=$(ENV_PATH) $(COMPOSE_EXE) -f $(COMPOSE_PATH) --env-file $(ENV_PATH)

# ##################
# TARGETS 
# ##################

# build & run
build:
	-@($(COMPOSE_CMD) up --no-deps --build build)

# docker compose - down 
prune:
	-@($(COMPOSE_CMD) down --volumes --remove-orphans)

# docker compose - ps
show:
	-@($(COMPOSE_CMD) ps -a)
