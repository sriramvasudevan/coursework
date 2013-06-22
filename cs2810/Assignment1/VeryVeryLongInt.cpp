/* 
 * File:   VeryVeryLongInt.cpp
 * Author: Sriram V.
 *
 * Created on 2 February, 2013, 11:30 PM
 */

#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include "LinkedList.h"
#include "VeryVeryLongInt.h"

#ifndef WIDTH
#define WIDTH 4
#endif

#ifndef BASE
#define BASE 10000
#endif

#ifndef TYPE
#define TYPE int
#endif

/*******************************************************************************
 * 
 * A library of functions to handle the VeryVeryLongInt custom data type.
 * 
 ******************************************************************************/

using namespace std;

VeryVeryLongInt::~VeryVeryLongInt() {
    list->clear();
    delete list;
}

VeryVeryLongInt::VeryVeryLongInt() {
    sign = '+';
    list = new LinkedList();
}

VeryVeryLongInt::VeryVeryLongInt(const VeryVeryLongInt& num) {
    sign = num.sign;
    list = new LinkedList(*(num.list));
}

VeryVeryLongInt::VeryVeryLongInt(TYPE num) {
    list = new LinkedList();
    if (num >= 0) {
        sign = '+';
    } else {
        sign = '-';
        num = 0 - num;
    }

    if (num == 0) {
        list->insert_most_significant(0);
    } else {
        for (int i = 0; num > 0; i++) {
            list->insert_most_significant(num % BASE);
            num = num / BASE;
        }
    }
}

VeryVeryLongInt::VeryVeryLongInt(const char str[]) {
    char* strtemp = new char[strlen(str) + 1];
    strcpy(strtemp, str);
    list = new LinkedList();
    sign = '+';
    if (strtemp[0] == '-') {
        sign = '-';
        ++strtemp;
    }
    for (int i = strlen(strtemp) - 1; i >= 0; i--) {
        int value = 0;
        if (i < 4) {
            for (int k = 0; i >= 0; i--, k++) {
                value += ((strtemp[i] - '0') * pow(10, k));
            }
        } else {
            for (int k = 0; k != 4; i--, k++) {
                value += ((strtemp[i] - '0') * pow(10, k));
            }
            i++;
        }
        list->insert_most_significant(value);
    }
}

VeryVeryLongInt& VeryVeryLongInt::operator =(const VeryVeryLongInt& num) {
    if (this != &num) {
        sign = num.sign;
        list->clear();
        delete list;
        list = new LinkedList(*(num.list));
    }
    return *this;
}

VeryVeryLongInt& VeryVeryLongInt::operator =(const char str[]) {
    *this = VeryVeryLongInt(str);
    return *this;
}

VeryVeryLongInt& VeryVeryLongInt::operator =(TYPE num) {
    *this = VeryVeryLongInt(num);
    return *this;
}

void VeryVeryLongInt::flip_sign() {
    if (sign == '-') sign = '+';
    else sign = '-';
}

void VeryVeryLongInt::mod() {
    if (sign == '-') sign = '+';
}

void VeryVeryLongInt::removeLeadingZeroes() {
    TYPE digit = list->pop_most_significant();
    while ((digit == 0) && (list->length() > 0)) {
        digit = list->pop_most_significant();
    }
    list->insert_most_significant(digit);
}

//friend functions.
ostream& operator<<(ostream& out, VeryVeryLongInt& num) {
    LinkedList * temp = new LinkedList(*(num.list));
    if (num.sign == '-') out << '-';
    if (temp->length() > 0) {
        out << temp->pop_most_significant();
    }
    //Since we need to print node by node, and since we will
    //need the leading zeroes for the following nodes (which aren't stored in the int),
    //we need to add these missing zeroes in.
    //Ex: To print 10001, 1 gets printed above, and 0001 below.
    for (int i = temp->length(); i > 0; i--) {
        out << setfill('0') << setw(WIDTH);
        out << temp->pop_most_significant();
    }
    return out;
}

VeryVeryLongInt mod(VeryVeryLongInt num) {
    VeryVeryLongInt retval= num;
    retval.mod();
    return retval;
}

//helper functions.
VeryVeryLongInt add_bigints_sorted(const VeryVeryLongInt& shorter, const VeryVeryLongInt& longer) {
    // This function is not supposed to be used directly
    // it is a helper function of add_bigints

    // note that, shorter and longer basically denote the bigint list length
    // it is assumed that both the numbers have same sign
    // hence only their magnitudes are added
    VeryVeryLongInt answer;
    TYPE carry = 0;
    TYPE sum;
    unsigned int shorter_length = shorter.list->length();
    Node* i = shorter.list->least_significant;
    Node* j = longer.list->least_significant;

    for (; i != NULL; i = i->prev, j = j->prev) {
        sum = i->value + j->value + carry;
        answer.list->insert_most_significant(sum % BASE);
        carry = sum / BASE;
    }
    while (j != NULL) {
        sum = j->value + carry;
        answer.list->insert_most_significant(sum % BASE);
        carry = sum / BASE;
        j = j->prev;
    }
    if (carry != 0) {
        answer.list->insert_most_significant(carry);
    }
    answer.sign = shorter.sign;
    // assuming that both the numbers have been trimmed of
    // their zeroes already, the answer need not be trimmed
    // of its zeroes
    return answer;
}

VeryVeryLongInt add_bigints(VeryVeryLongInt& num1, VeryVeryLongInt& num2) {
    // This function is not supposed to be used directly
    // it is helper function of the operator +

    // note that by add, we mean that the sum of
    // the magnitudes of the two numbers is to be
    // calculated.

    // as the function is never called directly, and
    // care is taken to trim zeroes of both the bigints,
    // no need to trim zeroes
    if (num1.list->length() < num2.list->length()) {
        return add_bigints_sorted(num1, num2);
    } else return add_bigints_sorted(num2, num1);
}

VeryVeryLongInt subtract_bigints_sorted(const VeryVeryLongInt& shorter, const VeryVeryLongInt& longer) {
    // This function is not supposed to be used directly
    // it is helper function of the function subtract_bigints

    // smaller and bigger in terms of magnitude, not value.
    // note that this 'sortedness' is different from the
    // one in add_bigints_sorted()
    VeryVeryLongInt answer;
    TYPE borrow = 0;
    TYPE difference;
    unsigned int shorter_length = shorter.list->length();
    Node* i = shorter.list->least_significant;
    Node* j = longer.list->least_significant;


    for (; i != NULL; i = i->prev, j = j->prev) {
        difference = j->value - (i->value + borrow);
        borrow = 0;
        if (difference < 0) {
            difference = BASE + difference;
            borrow = 1;
        }
        answer.list->insert_most_significant(difference);
    }
    while (j != NULL) {
        difference = j->value - borrow;
        borrow = 0;
        if (difference < 0) {
            difference = BASE + difference;
            borrow = 1;
        }
        answer.list->insert_most_significant(difference);
        j = j->prev;
    }

    answer.sign = longer.sign;
    answer.removeLeadingZeroes();
    return answer;
}

VeryVeryLongInt subtract_bigints(VeryVeryLongInt& num1, VeryVeryLongInt& num2) {
    // This function is not supposed to be used directly
    // it is helper function of the operator +

    // note that by subtract, we mean the difference
    // between the magnitudes of the two numbers has
    // to be calculated.

    // as the function is never called directly, and
    // care is taken to trim zeroes of both the bigints,
    // no need to trim zeroes
    if (num1.list->length() < num2.list->length()) {
        return subtract_bigints_sorted(num1, num2);
    } else if (num2.list->length() < num1.list->length()) {
        return subtract_bigints_sorted(num2, num1);
    } else {
        LinkedList list1(*(num1.list));
        LinkedList list2(*(num2.list));
        TYPE int1 = list1.pop_most_significant();
        TYPE int2 = list2.pop_most_significant();
        while ((int1 == int2) && (list1.length() > 0)) {
            int1 = list1.pop_most_significant();
            int2 = list2.pop_most_significant();
        }
        if ((list1.length() == 0) && (int1 == int2)) {
            // the second condition above is for the cases
            // when there is only one 'digit' in the bigint
            VeryVeryLongInt ans(0);
            return ans;
        } else if (int1 > int2) {
            return subtract_bigints_sorted(num2, num1);
        } else {
            return subtract_bigints_sorted(num1, num2);
        }
    }
}

//Logical operations.
ComparisonResult VeryVeryLongInt::compare_magnitude_with(VeryVeryLongInt& num) {
    // This function is not supposed to be used directly
    // it is helper function

    // as the function is never called directly,
    // care must be taken to trim zeroes by the caller
    if (list->length() < num.list->length())
        return IS_SMALLER;
    if (list->length() > num.list->length())
        return IS_GREATER;

    LinkedList list1(*(list));
    LinkedList list2(*(num.list));
    TYPE int1 = list1.pop_most_significant();
    TYPE int2 = list2.pop_most_significant();
    while ((int1 == int2)&&(list1.length() > 0)) {
        int1 = list1.pop_most_significant();
        int2 = list2.pop_most_significant();
    }
    if ((list1.length() == 0) && (int1 == int2))
        // the second condition above is for the cases
        // when there is only one 'digit' in the bigint
        return IS_EQUAL;
    else if (int1 > int2)
        return IS_GREATER;
    else
        return IS_SMALLER;
}

bool VeryVeryLongInt::operator ==(VeryVeryLongInt& num) {
    if (sign != num.sign)
        return false;
    else {
        removeLeadingZeroes();
        num.removeLeadingZeroes();
        return (compare_magnitude_with(num) == IS_EQUAL);
    }
}

bool VeryVeryLongInt::operator <(VeryVeryLongInt& num) {
    if ((sign == '+')&&(num.sign == '-'))
        return false;
    if ((sign == '-')&&(num.sign == '+'))
        return true;
    if (*this == num)
        return false;
    removeLeadingZeroes();
    num.removeLeadingZeroes();
    if (sign == '-')
        return ( compare_magnitude_with(num) == IS_GREATER );
    else
        return ( compare_magnitude_with(num) == IS_SMALLER );
}

bool VeryVeryLongInt::operator >(VeryVeryLongInt& num) {
    return (! ( (*this == num)|| (*this < num)) );
}

bool VeryVeryLongInt::operator <=(VeryVeryLongInt& num) {
    return ( ! (*this > num) );
}

bool VeryVeryLongInt::operator ==(TYPE num) {
    VeryVeryLongInt bigint(num);
    return (*this == bigint);
}

bool VeryVeryLongInt::operator <=(TYPE num) {
    VeryVeryLongInt bigint(num);
    return (*this <= bigint);
}

//Arithmetic operations.
const VeryVeryLongInt VeryVeryLongInt::operator +(VeryVeryLongInt& num) {
    removeLeadingZeroes();
    num.removeLeadingZeroes();
    if (sign == num.sign) return add_bigints(*this, num);
    else return subtract_bigints(*this, num);
}

const VeryVeryLongInt VeryVeryLongInt::operator +(TYPE num) {
    VeryVeryLongInt bigint(num);
    return *this +bigint;
}

const VeryVeryLongInt VeryVeryLongInt::operator -(VeryVeryLongInt& num) {
    VeryVeryLongInt negative = num;
    negative.flip_sign();
    return (*this +negative);
}

const VeryVeryLongInt VeryVeryLongInt::operator -(TYPE num) {
    VeryVeryLongInt bigint(num);
    return *this -bigint;
}

VeryVeryLongInt multiply_bigint_by_positive_number(const VeryVeryLongInt& bigint, TYPE number) {
    VeryVeryLongInt answer;
    TYPE carry = 0;
    TYPE product;
    unsigned int length_of_bigint = bigint.list->length();
    for (Node* i = bigint.list->least_significant; i != NULL; i = i->prev) {
        product = (i->value * number) + carry;
        answer.list->insert_most_significant(product % BASE);
        carry = product / BASE;
    }
    if (carry != 0) {
        answer.list->insert_most_significant(carry);
    }
    answer.sign = bigint.sign;
    return answer;
}

const VeryVeryLongInt VeryVeryLongInt::operator *(VeryVeryLongInt& num) {
    num.removeLeadingZeroes();
    removeLeadingZeroes();
    VeryVeryLongInt product;
    VeryVeryLongInt answer(0);
    unsigned int num_length = num.list->length();
    int x = 0;
    for (Node* i = num.list->least_significant; i != NULL; i = i->prev, x++) {
        product = multiply_bigint_by_positive_number(*this, i->value);
        for (unsigned int j = 0; j < x; j++) {
            product.list->insert_least_significant(0); // push left
        }
        answer = answer + product;
    }
    if (sign != num.sign) answer.sign = '-';
    else answer.sign = '+';
    return answer;
}

const VeryVeryLongInt VeryVeryLongInt::operator *(TYPE num) {
    removeLeadingZeroes();
    if (num < 0) {
        VeryVeryLongInt ans = multiply_bigint_by_positive_number(*this, (0 - num));
        ans.flip_sign();
        return ans;
    } else {
        return multiply_bigint_by_positive_number(*this, num);
    }
}

const VeryVeryLongInt long_division(VeryVeryLongInt& dividend, VeryVeryLongInt& divisor, ResultChoice choice) {
    divisor.removeLeadingZeroes();
    dividend.removeLeadingZeroes();
    VeryVeryLongInt quotient(0);
    VeryVeryLongInt subtrahend(0);
    unsigned int num_length = divisor.list->length();
    if (num_length > dividend.list->length()) {
        return quotient;
    }
    for (Node* i = dividend.list->most_significant; i != NULL; i = i->next) {
        VeryVeryLongInt temp(i->value);
        subtrahend = subtrahend*BASE;
        subtrahend = subtrahend + temp;
        int j=0;
        if(subtrahend.list->length()>=divisor.list->length()) {
            VeryVeryLongInt minuend(0);
            while(minuend <= subtrahend) {
                ++j;
                minuend = divisor*j;
            }
            --j;
            minuend = minuend - divisor;
            quotient = quotient*BASE;
            quotient = quotient + j;
            subtrahend = subtrahend - minuend;
        }
    }

    if (dividend.sign != divisor.sign) quotient.sign = '-';
    else quotient.sign = '+';
    if (choice == QUOTIENT) return quotient;    
    else if (choice == REMAINDER) return subtrahend;
    cerr<<"\nQUOTIENT or REMAINDER choice only.";
    exit(-1);
}

const VeryVeryLongInt VeryVeryLongInt::operator /(VeryVeryLongInt& num) {
    return long_division(*this, num, QUOTIENT);
}

const VeryVeryLongInt VeryVeryLongInt::operator /(TYPE num) {
    VeryVeryLongInt temp(num);
    temp = (*this)/temp;
    return temp;
}

const VeryVeryLongInt VeryVeryLongInt::operator %(VeryVeryLongInt& num) {
    return long_division(*this, num, REMAINDER);
}

const VeryVeryLongInt VeryVeryLongInt::operator %(TYPE num) {
    VeryVeryLongInt temp(num);
    temp = (*this)%temp;
    return temp;
}

bool div(VeryVeryLongInt a, VeryVeryLongInt b) {
    VeryVeryLongInt remainder;
    remainder = a%b;
    VeryVeryLongInt zero_ref = 0;
    return (remainder==zero_ref);
}

VeryVeryLongInt factorial(VeryVeryLongInt num) {
    VeryVeryLongInt factorial_result(1);
    if (num > factorial_result) {
        for (VeryVeryLongInt i=2; i<=num; i=i+1) {
            factorial_result = factorial_result*i;
        }
    }
    return factorial_result;
}

VeryVeryLongInt power(VeryVeryLongInt num, unsigned TYPE k) {
    VeryVeryLongInt powval(1);
    if (k==1) {
        return num;
    }
    if (k==0) {
        return powval;
    }
    VeryVeryLongInt temp;
    if (k%2) {
        temp = power(num, (k-1)/2);
        powval = temp*temp;
        powval = powval*num;
    }
    else {
        temp = power(num, k/2);
        powval = temp*temp;
    }
    return powval;
}

/*
//test function.
int main() {
VeryVeryLongInt b = "200000000";
VeryVeryLongInt c = "1011111";
VeryVeryLongInt a = 100;
a = factorial(a);
int k=10000;
VeryVeryLongInt powval;
VeryVeryLongInt baseval = 2;
VeryVeryLongInt refval = 1024;
powval=power(baseval, k);
cout<<powval;

return 0;
}
*/
