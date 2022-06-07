#include <iostream>

//Change to angular brackets dure target_include_directories
//because preprocessor knows where to look
#include <print.hpp>

void myPrint(std::vector<double> const& list)
{
  for(double d: list)
  {
    std::cout << d << ' ';
  }
  std::cout << '\n';
}

