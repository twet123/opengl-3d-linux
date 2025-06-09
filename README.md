# OpenGL 3D Starter Linux

## 1. Instalacija paketa

### 1.1 Debian / Ubuntu / Ostali Debian-Like OS

```
sudo apt-get update
sudo apt-get install cmake pkg-config
sudo apt-get install mesa-utils libglu1-mesa-dev freeglut3-dev mesa-common-dev
sudo apt-get install libglew-dev libglfw3-dev libglm-dev
sudo apt-get install libao-dev libmpg123-dev
```

### 1.2 Fedora

```
sudo dnf upgrade
sudo dnf install cmake pkg-config
sudo dnf install mesa-demos mesa-libGLU-devel freeglut-devel mesa-libGL-devel
sudo dnf install glew-devel glfw-devel glm-devel
sudo dnf install libao-devel mpg123-devel
```

### 1.3 MacOS

TODO: Istražiti koji su ekvivalnti paketa za MacOS

U suštini svi ostali koraci su isti i na Mac-u.

## 2. Instalacija GLFW-a (Univerzalan korak)

```
cd /usr/local/lib/
git clone https://github.com/glfw/glfw.git
cd glfw
cmake .
make
sudo make install
```

## 3. Podešavanje GLAD biblioteke

1. Otvoriti [GLAD web servis](http://glad.dav1d.de)
2. Odabrati jezik **C++** i specifikaciju **OpenGL**
3. U sekciji **API**, odabrati minimalno gl verziju **3.3**, staviti profil na **Core**, i odabrati opciju **Generate a loader**
4. Zanemariti deo sa ekstenzijama i kliknuti **Generate**
5. Preuzeti **glad**.zip fajl koji sadrži dva foldera **include** i **src**
6. Kopirati sadržaj **include** foldera u sistemski include folder

```
sudo cp -R include/* /usr/include/
```

7. Kopirati **glad.c** (iz src foldera) u radni direktorijum gde je main.cpp

## 4. Izmene u kodu

Potrebno je:

1. Zameniti liniju `#include <GL/glew.h>` sa `#include <glad.glad.h>`
2. Zameniti deo gde se proverava da li je glew učitan `glewInit() != GLEW_OK` sa:

```cpp
if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
{
    std::cout << "Failed to initialize GLAD" << std::endl;
    return -1;
}
```

## 5. Pokretanje programa

```
make clean run
```

## 6. Dodatne napomene

- Slobodno predložite izmene ili dopune ovog uputstva ukoliko naiđete na probleme ili imate predloge za poboljšanje.
- Ako naiđete na problem, otvorite **Issue** na repozitorijumu i pokušaćemo da ga rešimo što pre.
