
//Change to angular brackets dure target_include_directories
//because preprocessor knows where to look
#include <sort.hpp>

#include <algorithm>

void mySort(std::vector<double> &list)
{
 std::sort(list.begin(), list.end());
}
