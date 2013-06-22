< void VeryVeryLongInt::removeLeadingZeroes() {
---
> void VeryVeryLongInt::trim_zeroes() {
132d130
< //friend functions.
156c154,191
< //helper functions.
---
> bool div(VeryVeryLongInt a, VeryVeryLongInt b) {
>     VeryVeryLongInt remainder;
>     remainder = a%b;
>     VeryVeryLongInt zero_ref = 0;
>     return (remainder==zero_ref);
> }
> 
> VeryVeryLongInt factorial(VeryVeryLongInt num) {
>     VeryVeryLongInt factorial_result(1);
>     if (num > factorial_result) {
>         for (VeryVeryLongInt i=2; i<=num; i=i+1) {
>             factorial_result = factorial_result*i;
>         }
>     }
>     return factorial_result;
> }
> 
> VeryVeryLongInt power(VeryVeryLongInt num, unsigned TYPE k) {
>     VeryVeryLongInt powval(1);
>     if (k==1) {
>         return num;
>     }
>     if (k==0) {
>         return powval;
>     }
>     VeryVeryLongInt temp;
>     if (k%2) {
>         temp = power(num, (k-1)/2);
>         powval = temp*temp;
>         powval = powval*num;
>     }
>     else {
>         temp = power(num, k/2);
>         powval = temp*temp;
>     }
>     return powval;
> }
> 
244c279
<     answer.removeLeadingZeroes();
---
>     answer.trim_zeroes();
285d319
< //Logical operations.
292c326
<      if (list->length() < num.list->length())
---
>      if (this->list->length() < num.list->length())
294c328
<      if (list->length() > num.list->length())
---
>      if (this->list->length() > num.list->length())
297c331
<      LinkedList list1(*(list));
---
>      LinkedList list1(*(this->list));
316c350
<      if (sign != num.sign)
---
>      if (this->sign != num.sign)
319,321c353,355
<           removeLeadingZeroes();
<           num.removeLeadingZeroes();
<           return (compare_magnitude_with(num) == IS_EQUAL);
---
>           this->trim_zeroes();
>           num.trim_zeroes();
>           return (this->compare_magnitude_with(num) == IS_EQUAL);
326c360
<      if ((sign == '+')&&(num.sign == '-'))
---
>      if ((this->sign == '+')&&(num.sign == '-'))
328c362
<      if ((sign == '-')&&(num.sign == '+'))
---
>      if ((this->sign == '-')&&(num.sign == '+'))
332,335c366,369
<      removeLeadingZeroes();
<      num.removeLeadingZeroes();
<      if (sign == '-')
<           return ( compare_magnitude_with(num) == IS_GREATER );
---
>      this->trim_zeroes();
>      num.trim_zeroes();
>      if (this->sign == '-')
>           return ( this->compare_magnitude_with(num) == IS_GREATER );
337c371
<           return ( compare_magnitude_with(num) == IS_SMALLER );
---
>           return ( this->compare_magnitude_with(num) == IS_SMALLER );
347a382,385
> bool VeryVeryLongInt::operator >=(VeryVeryLongInt& num) {
>      return ( ! (*this < num) );
> }
> 
352a391,400
> bool VeryVeryLongInt::operator <(TYPE num) {
>      VeryVeryLongInt bigint(num);
>      return (*this < bigint);
> }
> 
> bool VeryVeryLongInt::operator >(TYPE num) {
>      VeryVeryLongInt bigint(num);
>      return (*this > bigint);
> }
> 
358c406,410
< //Arithmetic operations.
---
> bool VeryVeryLongInt::operator >=(TYPE num) {
>      VeryVeryLongInt bigint(num);
>      return (*this >= bigint);
> }
> 
360,362c412,414
<     removeLeadingZeroes();
<     num.removeLeadingZeroes();
<     if (sign == num.sign) return add_bigints(*this, num);
---
>     this->trim_zeroes();
>     num.trim_zeroes();
>     if (this->sign == num.sign) return add_bigints(*this, num);
370a423,449
> /*
> VeryVeryLongInt VeryVeryLongInt::operator ++(int foo) {
>      // postfix : increment, return old one
>      VeryVeryLongInt old(*this);
>  *this = *this + 1;
>      return old;
> }
> 
> VeryVeryLongInt VeryVeryLongInt::operator ++() {
>      // prefix : increment, return incremented
>  *this = *this + 1;
>      return *this;
> }
> 
> VeryVeryLongInt VeryVeryLongInt::operator --(int foo) {
>      // postfix : decrement, return old one
>      VeryVeryLongInt old(*this);
>  *this = *this - 1;
>      return old;
> }
> 
> VeryVeryLongInt VeryVeryLongInt::operator --() {
>      // prefix : decrement, return decremented
>  *this = *this - 1;
>      return *this;
> }
>  */
400,401c479,480
<     num.removeLeadingZeroes();
<     removeLeadingZeroes();
---
>     num.trim_zeroes();
>     this->trim_zeroes();
413c492
<     if (sign != num.sign) answer.sign = '-';
---
>     if (this->sign != num.sign) answer.sign = '-';
419c498
<     removeLeadingZeroes();
---
>     this->trim_zeroes();
429,431c508,510
< const VeryVeryLongInt long_division(VeryVeryLongInt& dividend, VeryVeryLongInt& divisor, ResultChoice choice) {
<     divisor.removeLeadingZeroes();
<     dividend.removeLeadingZeroes();
---
> const VeryVeryLongInt VeryVeryLongInt::operator /(VeryVeryLongInt& num) {
>     num.trim_zeroes();
>     this->trim_zeroes();
434,435c513,514
<     unsigned int num_length = divisor.list->length();
<     if (num_length > dividend.list->length()) {
---
>     unsigned int num_length = num.list->length();
>     if (num.list->length()>list->length()) {
438c517
<     for (Node* i = dividend.list->most_significant; i != NULL; i = i->next) {
---
>     for (Node* i = list->most_significant; i != NULL; i = i->next) {
443c522
<         if(subtrahend.list->length()>=divisor.list->length()) {
---
>         if(subtrahend.list->length()>=num.list->length()) {
447c526
<                 minuend = divisor*j;
---
>                 minuend = num*j;
450c529
<             minuend = minuend - divisor;
---
>             minuend = minuend - num;
457c536
<     if (dividend.sign != divisor.sign) quotient.sign = '-';
---
>     if (this->sign != num.sign) quotient.sign = '-';
459,466c538
<     if (choice == QUOTIENT) return quotient;    
<     else if (choice == REMAINDER) return subtrahend;
<     cerr<<"\nQUOTIENT or REMAINDER choice only.";
<     exit(-1);
< }
< 
< const VeryVeryLongInt VeryVeryLongInt::operator /(VeryVeryLongInt& num) {
<     return long_division(*this, num, QUOTIENT);
---
>     return quotient;
468a541
> /*
470,471c543,544
<     VeryVeryLongInt temp(num);
<     temp = (*this)/temp;
---
>     VeryVeryLongInt temp;
>     temp = *this / VeryVeryLongInt(num);
473a547
>  */
476,496c550,570
<     return long_division(*this, num, REMAINDER);
< }
< 
< const VeryVeryLongInt VeryVeryLongInt::operator %(TYPE num) {
<     VeryVeryLongInt temp(num);
<     temp = (*this)%temp;
<     return temp;
< }
< 
< bool div(VeryVeryLongInt a, VeryVeryLongInt b) {
<     VeryVeryLongInt remainder;
<     remainder = a%b;
<     VeryVeryLongInt zero_ref = 0;
<     return (remainder==zero_ref);
< }
< 
< VeryVeryLongInt factorial(VeryVeryLongInt num) {
<     VeryVeryLongInt factorial_result(1);
<     if (num > factorial_result) {
<         for (VeryVeryLongInt i=2; i<=num; i=i+1) {
<             factorial_result = factorial_result*i;
