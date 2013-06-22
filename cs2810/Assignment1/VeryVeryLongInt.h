/* 
 * File:   VeryVeryLongInt.h
 * Author: Sriram V.
 *
 * Created on 2 February, 2013, 11:31 PM
 */

#ifndef VERYVERYLONGINT_H
#define VERYVERYLONGINT_H

#include <iostream>
#include <cstring>
#include "LinkedList.h"

#define TYPE int

using namespace std;

enum ComparisonResult {
    IS_SMALLER,
    IS_EQUAL,
    IS_GREATER
};

enum ResultChoice {
    QUOTIENT,
    REMAINDER
};

class VeryVeryLongInt {
    public:
        LinkedList* list;
        char sign;
    private :
        ComparisonResult compare_magnitude_with(VeryVeryLongInt&);
    public :
        VeryVeryLongInt();
        VeryVeryLongInt(const VeryVeryLongInt&);
        VeryVeryLongInt(const char[]);
        VeryVeryLongInt(TYPE);

        //Overloading operators
        VeryVeryLongInt& operator =(const VeryVeryLongInt &);
        VeryVeryLongInt& operator =(const char[]);
        VeryVeryLongInt& operator =(TYPE);
        const VeryVeryLongInt operator +(VeryVeryLongInt &);
        const VeryVeryLongInt operator -(VeryVeryLongInt &);
        const VeryVeryLongInt operator *(VeryVeryLongInt &);
        const VeryVeryLongInt operator /(VeryVeryLongInt &);
        const VeryVeryLongInt operator %(VeryVeryLongInt &);
        const VeryVeryLongInt operator +(TYPE);
        const VeryVeryLongInt operator -(TYPE);
        const VeryVeryLongInt operator *(TYPE);
        const VeryVeryLongInt operator /(TYPE);
        const VeryVeryLongInt operator %(TYPE);
        bool operator ==(VeryVeryLongInt&);
        bool operator <(VeryVeryLongInt&);
        bool operator >(VeryVeryLongInt&);
        bool operator <=(VeryVeryLongInt&);
        bool operator ==(TYPE);
        bool operator <(TYPE);
        bool operator >(TYPE);
        bool operator <=(TYPE);

        /*
        VeryVeryLongInt operator ++();
        VeryVeryLongInt operator --();
        VeryVeryLongInt operator ++(int);
        VeryVeryLongInt operator --(int);
        */

        friend std::ostream& operator<< (std::ostream&, VeryVeryLongInt&);
        friend VeryVeryLongInt mod(const VeryVeryLongInt&);

        //other functions
        void flip_sign();
        void removeLeadingZeroes();
        void mod();

        //destructor
        ~VeryVeryLongInt();

};

bool div(VeryVeryLongInt, VeryVeryLongInt);
VeryVeryLongInt factorial(VeryVeryLongInt);
VeryVeryLongInt power(VeryVeryLongInt, unsigned TYPE);
#endif
