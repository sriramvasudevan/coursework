/* 
 * File:   main.cpp
 * Author: sriram
 *
 * Created on 17 February, 2013, 10:50 PM
 */

#include <cstdlib>
#include<iostream>
#include<string>
#include<sstream>

using namespace std;

/*******************************************************************************
 * 
 * Convert an infix expression to its postfix form and evaluate.
 * 
 ******************************************************************************/

#define MAXSIZE 100
//linked list structure to store strings

struct llist {
    string value;
    llist* next;
};

class stack {
    public:
        //Constructor function. Initialises the pointer to the topmost element of the stack to NULL

        stack() {
            first = NULL;
        }
        //Function to remove and return the topmost element

        string pop() {
            if (first == NULL) return ""; //in case of no element returns an empty string
            string toreturn = first->value;
            first = first->next; //pops the element and removes the reference to it from the stack
            return toreturn;
        }

        string top() {
            return first->value;
        }
        //pushes value (from argument) onto the stack

        void push(string value) {
            llist* current = new llist; //create a new element
            current->value = value;
            current->next = first;
            first = current; //put the new element at the top of the stack 
        }

        bool empty() {
            return (first == NULL);
        }
    private:
        llist* first; //pointer to the topmost element of the stack

};

//Defining operator precedence
int precedence(string op) {
    if (op == "++" || op == "--" || op == "u+" || op == "u-" || op == "!")
        return 6;
    if (op == "*" || op == "/" || op == "%")
        return 5;
    if (op == "+" || op == "-")
        return 4;
    if (op == "<" || op == "<=" || op == ">" || op == ">=")
        return 3;
    if (op == "==" || op == "!=")
        return 2;
    if (op == "=" || op == "?" || op == ":")
        return 1;
    if (op == "(" || op == ")")
        return 0;
    return 0;
}

//This function extracts the operators and operands into individual strings
int extract(string str, string* toCopy) {

    int str_i = 0; //maintains a record of which position of str_i we are reading into 
    int nameFlag = 1; // nameFlag indicates whether we are currently reading a variable name ( 1 ) or an operator ( 0 ) 
    int declared = 0; // declared indicates whether a new string has been dynamically allocated for the current variable name
    if (precedence(str.substr(0, 1)) || str.substr(0, 1) == "(" || str.substr(0, 1) == ")") {
        nameFlag = 0;
    } //if it belongs with a non-variable name, then set nameFlag to 0 before entering the loop
    string temp;
    toCopy [0] = "";
    for (int i = 0; i < str.length(); i++) {
        temp = str.substr(i, 1);
        if (temp == " " || temp == "\t") {
            if (str_i != 0 || toCopy [str_i] != "") str_i++;
            continue;
        }
        if (nameFlag) { //if we are currently reading a variable name
            if (precedence(temp)) { //if the current input is an operator
                nameFlag = 0; //indicate that we are not reading a variable name
                str_i++; //move to the next element of output array and assign
                toCopy [str_i] = temp;
            } else if (temp == "(" || temp == ")") {
                nameFlag = 0;
                str_i++;
                toCopy [str_i] = temp;
                str_i++; //increment again to prevent another operator being appended in the same string as ( or )
                toCopy [str_i] = "";
            } else {//if the current input is not an operator
                toCopy[str_i].append(temp); //assign it to the current variable name
            }
        } else { //if we are not currently reading a variable name
            if (precedence(temp)) { //if it is an operator
                string test = toCopy [str_i];
                test.append(temp);
                if (precedence(test)) { //if such a concatenation makes sense
                    if (i == 0 && (test == "+" || test == "-")) {
                        if (str.substr(1, 1) != "+" && str.substr(i, 1) != "-") {
                            toCopy [str_i] = "u"; //to set as a unary operand.
                        }
                    }
                    toCopy [str_i].append(temp); //append it to the existing operator string
                } else {
                    str_i++;
                    toCopy [str_i] = temp;
                }

            } else if (temp == "(" || temp == ")") {
                if (str_i != 0 || toCopy [str_i] != "") str_i++; //we must not append it to any other operator 
                toCopy [str_i] = temp;
                str_i++;
                toCopy [str_i] = "";
            } else { //if it is not an operator
                nameFlag = 1; //we are now reading a variable name
                if (toCopy [str_i] != "") str_i++; //move to the next element
                toCopy[str_i] = temp; //assign it
            }
        }
    }
    int total = str_i;
    for (int i = 0; i <= total; i++) {
        if (toCopy[i] == "") {
            for (int j = i + 1; j <= str_i; j++)
                toCopy[j - 1] = toCopy[j];
            str_i--;
        }
    }//this loop purges the string array of empty strings
    return str_i;
}

//Converts the infix expression (using the extracted operators and operands) into \
//its postfix form using a modification of the Shunting Yard Algorithm
int postConvert(string* input, int size, string* output) {

    stack ops;
    int out_index = 0;
    for (int i = 0; i < size; i++) {
        if (input[i] == "(") {
            ops.push(input[i]);
            continue;
        }
        if (input[i] == ")") {
            while (ops.top() != "(") {
                string temp = ops.pop();
                if (temp == "u+") {
                    temp = "+";
                } else if (temp == "u-") {
                    temp = "-";
                }
                output[out_index] = temp;
                out_index++;
            }
            ops.pop();
            continue;
        }
        if (precedence(input[i])) { //if current element is an operator
            if (ops.empty()) { //if the stack is empty
                ops.push(input[i]); //push the operator 
            } else {
                while (!ops.empty() && (precedence(input[i]) < precedence(ops.top()))) { //if current operator is of lower precedence
                    string temp = ops.pop();
                    if (temp == "u+") {
                        temp = "+";
                    } else if (temp == "u-") {
                        temp = "-";
                    }
                    output[out_index] = temp;
                    out_index++;
                }
                ops.push(input[i]); //and push this element
            }
        } else {

            output[out_index] = input[i];
            out_index++;
        }
    }
    while (!ops.empty()) {
        string temp = ops.pop();
        if (temp == "u+") {
            temp = "+";
        } else if (temp == "u-") {
            temp = "-";
        }

        output[out_index] = temp;
        out_index++; //pop from the stack until it is empty
    }
    return out_index;
}

//Used to clear the strings holding the extracted operators and operands
void clearStrings(string* stringList) {
    for (int i = 0; i < MAXSIZE; i++) {
        stringList[i] = "";
    }
}

//Converts an int into a string object.
string convertInt(int no) {
    stringstream ss;
    ss << no;
    return ss.str();
}

//Returns the no. of operands an operator operates on.
int cardinality(string input) {
    if (input == "++" || input == "--" || input == "!")
        return 1;
    else if (input == ":")
        return 3;
    return 2;

}

//Checks if a string is present in a list of strings.
int varIn(string a, string* list, int n) {
    int flag = 0;
    for (int i = 0; i < n; i++) {
        if (list[i] == a) {
            flag = 1;
            break;
        }
    }
    return flag;
}

//Evaluates the Postfix Expression using a stack.
void evaluateString(string* postfixString, int n) {
    int operands[MAXSIZE];
    stack op;
    int no_operands;
    int temp [MAXSIZE];
    string varlist[MAXSIZE]; //to store vars that have already been initialised.
    int list_n = 0;
    for (int i = 0; i < n; i++) {
        operands[i] = 0;
        if (!precedence(postfixString[i])) {
            if (!varIn(postfixString[i], varlist, list_n)) {
                cout << "\nEnter the value for " << postfixString[i] << endl;
                cin >> operands[i];
                varlist[list_n] = postfixString[i];
                list_n++;
            } else {
                for (int j = 0; j < i; j++) {
                    if (postfixString[j] == postfixString[i]) {
                        operands[i] = operands[j];
                        break;
                    }
                }
            }
        }
    }

    for (int i = 0; i < n; i++) {
        if (precedence(postfixString[i])) {
            if (postfixString[i] == "?") {
                continue;
            }
            no_operands = cardinality(postfixString[i]);

            //pop reqd. no of operands into a temporary int array.
            for (int j = 0; j < no_operands; j++) {
                if (op.empty()) {
                    temp[j] = 0;
                } else {
                    string poppedstr = op.pop();
                    temp[j] = atoi(poppedstr.c_str());
                }
            }

            //Operate depending on the no of operands accepted by an operator.
            switch (no_operands) {
                case 1: if (postfixString[i] == "++") {
                            temp[0]++;
                            operands[i]++;
                            op.push(convertInt(temp[0]));
                        } else if (postfixString[i] == "--") {
                            temp[0]--;
                            op.push(convertInt(temp[0]));
                        } else if (postfixString[i] == "!") {
                            temp[0] = !temp[0];
                            op.push(convertInt(temp[0]));
                        }
                        break;
                case 2: if (postfixString[i] == "+") {
                            temp[0] = temp[1] + temp[0];
                            op.push(convertInt(temp[0]));
                        } else if (postfixString[i] == "-") {
                            temp[0] = temp[1] - temp[0];
                            op.push(convertInt(temp[0]));
                        } else if (postfixString[i] == "*") {
                            temp[0] = temp[1] * temp[0];
                            op.push(convertInt(temp[0]));
                        } else if (postfixString[i] == "/") {
                            temp[0] = temp[1] / temp[0];
                            op.push(convertInt(temp[0]));
                        } else if (postfixString[i] == ">") {
                            temp[0] = temp[1] > temp[0];
                            op.push(convertInt(temp[0]));
                        } else if (postfixString[i] == "<") {
                            temp[0] = temp[1] < temp[0];
                            op.push(convertInt(temp[0]));
                        } else if (postfixString[i] == ">=") {
                            temp[0] = temp[1] >= temp[0];
                            op.push(convertInt(temp[0]));
                        } else if (postfixString[i] == "<=") {
                            temp[0] = temp[1] <= temp[0];
                            op.push(convertInt(temp[0]));
                        } else if (postfixString[i] == "==") {
                            temp[0] = temp[1] == temp[0];
                            op.push(convertInt(temp[0]));
                        } else if (postfixString[i] == "!=") {
                            temp[0] = (temp[1] != temp[0]);
                            op.push(convertInt(temp[0]));
                        } else if (postfixString[i] == "%") {
                            temp[0] = temp[1] % temp[0];
                            op.push(convertInt(temp[0]));
                        }
                        break;
                case 3:if (postfixString[i] == ":") {
                           temp[0] = (temp[2] ? temp[1] : temp[0]);
                           op.push(convertInt(temp[0]));
                       }
                       break;
            }
        } else { //not an operator => an operand.
            op.push(convertInt(operands[i]));
        }
    }
    cout << "Result = " << op.pop() << endl;

    /*
    //This code is used to display the values of the variables after the evaluation of the expression.
    string var_op[MAXSIZE];
    int oplist_n = 0;
    cout << "Final variable values:" << endl;
    for (int i = 0; i < n; i++) {
    if (!precedence(postfixString[i])) {
    if (!varIn(postfixString[i], var_op, n)) {
    cout << postfixString[i] << " = " << operands[i] << endl;
    var_op[oplist_n] = postfixString[i];
    oplist_n++;
    }
    }
    }*/
}

//The main function.
int main() {

    //stack strings;
    string inputString, bufferClear;
    string splitStrings [MAXSIZE], postfixString [MAXSIZE];
    int no_split;
    char c = 'a';
    while (c != 'q') {
        cout << "Enter your option. 'a' to enter infix string and 'q' to exit." << endl;
        cin >> c;
        if (c == 'a') {
            cin >> bufferClear;
            getline(cin, inputString);
            inputString = bufferClear.append(inputString); //these three lines will put the input into inputString
            no_split = extract(inputString, splitStrings); //splitStrings will be an array of no_split + 1 elements
            for (int i = 0; i <= no_split; i++) {
                cout << "Element no " << i << " is " << splitStrings[i] << endl;
            }
            //	postProcess ( splitStrings , no_split + 1 ) ;
            no_split = postConvert(splitStrings, no_split + 1, postfixString);
            cout << "The postfixString is" << endl;
            for (int i = 0; i <= no_split; i++) {
                cout << postfixString[i];
            }
            cout << endl;
            evaluateString(postfixString, no_split);
        }
        clearStrings(splitStrings);
    }
    /*	while ( c != 'q') {
        cout<<"Enter your option: 'u' to push and 'o' to pop."<<endl ;
        cin>>c ;
        if ( c == 'u' ){
        cout<<"Enter the string."<<endl ;
        cin>>bufferClear ;
        getline ( cin , inputString ) ;
        inputString = bufferClear.append ( inputString ) ;
        strings.push (inputString) ;
        }	
        if ( c == 'o' ) {
        cout<<strings.pop()<<endl ;
        }
        }*/
    return 0;
}
