# OpenGL 3D Starter Linux

### Instalacija paketa (Debian / Ubuntu / Ostali Debian-Like OS)

```
sudo apt-get update
sudo apt-get install cmake pkg-config
sudo apt-get install mesa-utils libglu1-mesa-dev freeglut3-dev mesa-common-dev
sudo apt-get install libglew-dev libglfw3-dev libglm-dev
sudo apt-get install libao-dev libmpg123-dev
```

### Instalacija paketa (Fedora)

```
sudo dnf upgrade
sudo dnf install cmake pkg-config
sudo dnf install mesa-demos mesa-libGLU-devel freeglut-devel mesa-libGL-devel
sudo dnf install glew-devel glfw-devel glm-devel
sudo dnf install libao-devel mpg123-devel
```

### Instalacija paketa (MacOS)

TODO: Istražiti koji su ekvivalnti paketa za MacOS

### Instalacija GLFW-a (Univerzalan korak)

```
cd /usr/local/lib/
git clone https://github.com/glfw/glfw.git
cd glfw
cmake .
make
sudo make install
```

### Podešavanje GLAD biblioteke

1. Otvoriti GLAD web servis - [link](http://glad.dav1d.de)
2. Odabrati jezik C++ i specifikaciju OpenGL
3. U sekciji API, odabrati minimalno gl verziju 3.3, staviti profil na Core, i odabrati opciju Generate a loader
4. Zanemariti deo sa ekstenzijama i kliknuti Generate
5. Preuzeti glad.zip fajl koji sadrži dva foldera inlude i src
6. Kopirati sadržaj include foldera u sistemski include folder

```
sudo cp -R include/* /usr/include/
```

7. Kopirati glad.c (iz src foldera) u radni direktorijum gde je main.cpp

### Izmene u kodu

Potrebno je:

1. Izmeniti liniju `#include <GL/glew.h>` sa `#include <glad.glad.h>`
2. Izmeniti deo gde se proverava da li je glew učitan `glewInit() != GLEW_OK` sa

```
if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
{
    std::cout << "Failed to initialize GLAD" << std::endl;
    return -1;
}
```

### Pokretanje programa

```
make clean run
```
