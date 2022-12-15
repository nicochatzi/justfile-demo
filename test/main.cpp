#include "demo/demo.h"

int main()
{
    static_assert(demo::fibonacci(0) == 0);
    static_assert(demo::fibonacci(1) == 1);
    static_assert(demo::fibonacci(2) == 1);
    static_assert(demo::fibonacci(3) == 2);
    static_assert(demo::fibonacci(4) == 3);
    static_assert(demo::fibonacci(5) == 5);

    return 0;
}
