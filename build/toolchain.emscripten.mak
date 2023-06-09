CC = emcc
CXX = emcc
LD = emcc
CPP = cpp

EMFLAGS = -s PRECISE_F32=1 -s ASYNCIFY=1

ifeq ($(DEBUG),1)
EMFLAGS += --profiling-funcs
EMFLAGS += -s ASSERTIONS=1
EMFLAGS += -s SAFE_HEAP=1
EMFLAGS += -s STACK_OVERFLOW_CHECK=1
endif

# Configure EMFLAGS
EMFLAGS += -s WASM=0

# Configure LDFLAGS
EMSCRIPTEN_MODULARIZE ?= 1
LDFLAGS += -s MODULARIZE=$(EMSCRIPTEN_MODULARIZE) -s 'EXPORT_NAME="Epsilon"' --memory-init-file 0

SFLAGS += $(EMFLAGS)
LDFLAGS += $(EMFLAGS) -Oz -s EXPORTED_FUNCTIONS='["_main", "_IonSimulatorKeyboardKeyDown", "_IonSimulatorKeyboardKeyUp", "_IonSimulatorEventsPushEvent", "_IonSoftwareVersion", "_IonPatchLevel", "_IonDisplayForceRefresh"]' -s EXTRA_EXPORTED_RUNTIME_METHODS='["UTF8ToString"]'
