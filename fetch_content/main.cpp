#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <iostream>
#include "math.hpp"


TEST(test_group, test_name){
    int result = sum(2,3);
    ASSERT_EQ(result, 5);
    //ASSERT_THAT(v, testing::ElementsAre(1, 2, 3));
}

