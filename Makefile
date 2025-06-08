app.o:
	g++ main.cpp glad.c -ldl -lglfw3 -o app.o
run: app.o
	./app.o
clean:
	rm app.o