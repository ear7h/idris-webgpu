#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

// #include <glad/glad.h>
#include <GLFW/glfw3.h>

static void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods)
{
    if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS) {
        glfwSetWindowShouldClose(window, GLFW_TRUE);
    }
}

int main() {
    printf("starting!\n");
    if (!glfwInit()) {
        printf("glfwInit failed\n");
        return EXIT_FAILURE;
    }

    GLFWwindow* window = glfwCreateWindow(640, 480, "My Title", NULL, NULL);
    printf("%p\n", window);

    glfwMakeContextCurrent(window);
    // gladLoadGL(glfwGetProcAddress);
    glfwSetKeyCallback(window, key_callback);

    while (!glfwWindowShouldClose(window)) {
        glfwPollEvents();
    }

    return EXIT_SUCCESS;
}
