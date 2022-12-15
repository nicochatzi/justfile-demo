#include <iostream>
#include "demo/demo.h"

int main()
{
    for (auto && in : {0, 1, 10, 12})
        std::cout << "in: " << in << ", out: " << demo::fibonacci(in) << std::endl;

    return 0;
}
