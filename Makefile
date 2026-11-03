SRC = src/tls.s
OBJ = build/tls.o
TARGET = tls

all: $(TARGET)

$(TARGET): $(OBJ)
	ld -e main build/tls.o -o tls

$(OBJ): $(SRC)
	mkdir build
	as $(SRC) -o build/tls.o

clean:
	rm -rf build $(TARGET)

.PHONY: all clean