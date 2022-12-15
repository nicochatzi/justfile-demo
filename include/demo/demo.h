#pragma once

#include <concepts>

namespace demo 
{
template <typename T>
requires std::integral<T> || std::floating_point<T>
constexpr T fibonacci(T n)
{
    return n < 0 ? 0 
                 : n == 1 ? 1
                          : fibonacci(n - 1) + fibonacci(n - 2);
}
}
