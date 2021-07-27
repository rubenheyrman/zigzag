#ifndef LIST_COORD_
#define LIST_COORD_

#include <iostream>
#include <iterator>
#include <string>
#include <algorithm>
#include <list>
#include <cassert>
// Use (void) to silent unused warnings.
#define assertm(exp, msg) assert(((void)msg, exp))

using namespace std;


inline void list_coordinates(list<int> iterations,     list<string> dimensions, list<bool> mapped_to_DRAM,
                      list<int> coordinate_val, list<string> coordinate_name,
                      list<list<int>> &result){
    assertm(iterations.size() == dimensions.size() && dimensions.size() == mapped_to_DRAM.size(),
            "Lists of first argument row in list_coordinate() function do not have the same dimensions!");
    assertm(coordinate_val.size() == coordinate_name.size(),
            "Lists of second argument row in list_coordinate() function do not have the same dimensions!");

  if (dimensions.size() != 0){

    auto it = iterations.rbegin();
    bool relevant = false;
    // iterations per mapped loop
    for (int j=0; j<*it; j++){
      auto coordinate_it = coordinate_val.begin();
      // relevant dimensions for specified operand
      for (auto i = coordinate_name.begin(); i != coordinate_name.end(); i++){
        // if dimension under scope is a relevant dimension
        if (dimensions.back() == *i){ //  || mapped_to_DRAM.back())

            int product = j;

            string dim = dimensions.back();
            dimensions.pop_back();
            int iter = iterations.back();
            iterations.pop_back();
            bool dram = mapped_to_DRAM.back();
            mapped_to_DRAM.pop_back();

            auto loops = iterations.begin();
            for (auto k = dimensions.begin(); k != dimensions.end(); k++){
                if (*k == *i){
                    product *= *loops;
                }
                loops++;
            }
            *coordinate_it += product;
            relevant = true;

            // push data in same function with the last dimension cut off
            list_coordinates(iterations, dimensions, mapped_to_DRAM, coordinate_val, coordinate_name, result);
            dimensions.push_back(dim);
            iterations.push_back(iter);
            mapped_to_DRAM.push_back(dram);
            *coordinate_it -= product;
            break;
        }
        coordinate_it++;
      }
    }
    if (!relevant) {
        dimensions.pop_back();
        iterations.pop_back();
        mapped_to_DRAM.pop_back();
        list_coordinates(iterations, dimensions, mapped_to_DRAM, coordinate_val, coordinate_name, result);
    }
  } else {
    list<int> temp;
    for (auto elem = coordinate_val.begin(); elem != coordinate_val.end(); elem++){
        temp.push_back(*elem); // cout << *it << " ";
    }
    result.push_back(temp); // cout << endl;
  }
}
#endif // LIST_COORD_

