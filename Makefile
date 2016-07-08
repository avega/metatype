# Makefile for UNIX systems.

# Executable file name
PROG=metatype

# Project dirs. Bin dir can be '.' for project root.
SRC_DIR=src
OBJ_DIR=obj
BIN_DIR=.

GCC=g++
STANDARD=-std=c++11
# STANDARD=
COMP_FLAGS=${STANDARD} -Wall
LINK_FLAGS=

CPP_FILES := $(wildcard ${SRC_DIR}/*.cpp)
OBJ_FILES := $(addprefix ${OBJ_DIR}/,$(notdir $(CPP_FILES:.cpp=.o)))

all: .make-dirs ${BIN_DIR}/${PROG} run

${BIN_DIR}/${PROG}: $(OBJ_FILES)
	@${GCC} $(LINK_FLAGS) -o $@ $^

${OBJ_DIR}/%.o: src/%.cpp
	@${GCC} $(COMP_FLAGS) -c -o $@ $<

run: ${PROG}
	@./${PROG}

clean:
	@rm -f $(OBJ_FILES)
	@if [ -d "${OBJ_DIR}" ]; then rmdir "${OBJ_DIR}"; fi

dist-clean: clean
	@if [ -e "${BIN_DIR}/${PROG}" ]; then rm "${BIN_DIR}/${PROG}"; fi
	@if [ "${BIN_DIR}" != "." ] && [ -d "${BIN_DIR}" ]; then rmdir "${BIN_DIR}"; fi

.make-dirs:
	@mkdir -p ${OBJ_DIR}
	@if [ "${BIN_DIR}" != "." ]; then mkdir -p "${BIN_DIR}"; fi

.PHONY: all run .make-dirs clean dist-clean
