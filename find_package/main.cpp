#include <print.hpp>
#include <sort.hpp>
#include <vector>

int main(int argc, char **argv)
{
  std::vector<double> example = {4, 5.4, 9.1, 1, -2.2};
  mySort(example);
  myPrint(example);
  return 0;
}