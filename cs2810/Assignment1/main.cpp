/* 
 * File:   main.cpp
 * Author: Sriram V.
 *
 * Created on 2 February, 2013, 11:30 PM
 */

#include <iostream>
#include "VeryVeryLongInt.h"
using namespace std;

/*******************************************************************************
 * 
 * Program to test VeryVeryLongInt custom data type.
 * 
 ******************************************************************************/

//test function.
int main() {
    VeryVeryLongInt a = 10000;
    a = factorial(a);
    cout<<a;
    /*
       factval = factorial(factval);
       cout<<factval<<endl;
       int k;
       VeryVeryLongInt baseval1 = 10;// 2;
    //VeryVeryLongInt baseval2 = 5;
    VeryVeryLongInt powval1 = baseval1;
    //VeryVeryLongInt powval2 = baseval2;
    //factval = factorial(factval);
    while (div(factval, powval1)) {// && div(factval, powval2)) {
    ++k;
    powval1 = power(baseval1, k);
    //powval2 = power(baseval2, k);
    }
    --k;
    cout<<k;
    */
    return 0;
}
