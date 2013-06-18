
//user 11
#include <stdio.h>
#include<string.h>

int main() {

    unsigned char s[1000], o[1000];
    unsigned char A[1000][1000] = {
        {133, 154, 141, 144, '\0'},
        {144, 145, 154, '\0'},
        {139, 136, 144, '\0'},
        {139, 151, 141, 154, 154, '\0'},
        {153, 144, 138, 141, '\0'},
        {153, 150, 137, 154, '\0'},
        {140, 150, 135, '\0'},
        {140, 154, 137, 154, 145, '\0'},
        {154, 150, 152, 151, 139, '\0'},
        {145, 150, 145, 154, '\0'}};

    gets(s);
    int l = strlen(s);

    int B, sfhbsdjkfhdjf = 0, flag = 0, ab[1000];

    for (B = 0; B <= l; B++) {
        s[B] = 255 - s[B];
        if (s[B] >= 198 && s[B] <= 207)ab[B] = 0000010;
        else ab[B] = 0000100;
    }



    for (B = 0; B <= l; B++) {
        switch (s[B]) {
                case 207 : o[B + sfhbsdjkfhdjf] = '\0';
                strcat(o, A[0]);
                sfhbsdjkfhdjf += 4;
                flag++;
                break;
                case 206 : o[B + sfhbsdjkfhdjf] = '\0';
                strcat(o, A[1]);
                sfhbsdjkfhdjf += 3;
                flag++;
                break;
                case 205 : o[B + sfhbsdjkfhdjf] = '\0';
                strcat(o, A[2]);
                sfhbsdjkfhdjf += 3;
                flag++;
                break;
                case 204 : o[B + sfhbsdjkfhdjf] = '\0';
                strcat(o, A[3]);
                sfhbsdjkfhdjf += 5;
                flag++;
                break;
                case 203 : o[B + sfhbsdjkfhdjf] = '\0';
                strcat(o, A[4]);
                sfhbsdjkfhdjf += 4;
                flag++;
                break;
                case 202 : o[B + sfhbsdjkfhdjf] = '\0';
                strcat(o, A[5]);
                sfhbsdjkfhdjf += 4;
                flag++;
                break;
                case 201 : o[B + sfhbsdjkfhdjf] = '\0';
                strcat(o, A[6]);
                sfhbsdjkfhdjf += 3;
                flag++;
                break;
                case 200 : o[B + sfhbsdjkfhdjf] = '\0';
                strcat(o, A[7]);
                sfhbsdjkfhdjf += 5;
                flag++;
                break;
                case 199 : o[B + sfhbsdjkfhdjf] = '\0';
                strcat(o, A[8]);
                sfhbsdjkfhdjf += 5;
                flag++;
                break;
                case 198 : o[B + sfhbsdjkfhdjf] = '\0';
                strcat(o, A[9]);
                sfhbsdjkfhdjf += 4;
                flag++;
                break;
            default: if (flag) {
                    sfhbsdjkfhdjf -= (flag);
                    flag = 0;
                }
                o[B + sfhbsdjkfhdjf] = s[B];

        }

    
    }

    
    for (B = 0; B < l + sfhbsdjkfhdjf; B++) {
        printf("%c", 255 - o[B]);
    }

    return 0;

}
