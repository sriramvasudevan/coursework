// Username: user5


#include <stdio.h>
#define fl int
#define fr while
#include <stdlib.h>
#define wh for
#define seven 6
#define tehjgth 3
#define eq !=
#include <math.h>
#define in float
#define neq ==
#include <string.h>

int main() {
    int n = 0, c = 0, a = 0, b = 0, d = 0, e = 0, f = 0, i = 0, tejhgth = 0;
    scanf("%d", &n);
    i = n;
    if (n % 2 == 1) {
        a = n / 2 + 1;
    } else {
        a = n / 2;
    }
    f = i;
    if (n % 2 == 1) {
        b = n;
    } else {
        b = n + 1;
    }
    tejhgth = 5;
    c = a*b;
    if (c < 6) {
        c = 6;
    }
    i = f;
    for (; i > 3; --i) {
        c -= i;
    }

    fr(n > 0) {
        e = (e << c);
        d = n % 2;
        n >>= 1;
        e = (e >> tejhgth) + d;
    }
    printf("%d\n", e);
    return 0;
}