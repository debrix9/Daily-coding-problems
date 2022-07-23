/*
07/20/2022
DAILY 1 WITH BONUS:
Given a list of numbers and a number k, return whether any two numbers from the list add up to k.
For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.
Bonus: Can you do this in one pass?
*/
#include <stdlib.h>
#include <iostream>
#include <set>
#include <vector>

using namespace std;
int n;
int k;

bool better_method(vector<int> &vals, int k)
{
    set<int> aux;
    for (int i = 0; i < vals.size(); i++)
    {
        if (aux.find(k - vals[i]) != aux.end())
        {
            cout << "There is a match: " << vals[i] << "+" << (*aux.end()) << "=" << k << endl;
            return true;
        }
        else
        {
            aux.insert(vals[i]);
        }
    }
    return false;
}


int naive_method(int v[], int n, int k, int &a, int &b, bool &answ)
{
    int check;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            if (i == j)
            {
                j++;
            }
            check = v[i] + v[j];
            if (check == k)
            {
                a = v[i];
                b = v[j];
                answ = true;
                break;
            }
        }
        if (answ == true)
        {
            break;
        }
    }
}
int main()
{
    while (1)
    {
        int a = 0, b = 0;
        int check;
        bool answ;
        int method;
        cout << "Choose method:" << endl;
        cout << "1)Naive Method\n2)Better Method" << endl;
        cin >> method;
        cout << "Insert n: ";
        cin >> n;
        //--------------------------------------------------------------
        //------------------------- METHOD 1 ---------------------------
        //--------------------------------------------------------------
        if (method == 1)
        {
            int val[n];
            for (int i = 0; i < n; i++)
            {
                cout << "Insert integer number " << i + 1 << ": ";
                cin >> val[i];
            }
            cout << "Insert k: ";
            cin >> k;
            answ = false;
            cout << "\n##########################" << endl;
            cout << "####NAIVE METHOD O(n^2)####"  << endl;
            cout << "##########################\n" << endl;
            naive_method(val, n, k, a, b, answ);
            if (answ == true)
            {
                cout << "There is a match: " << a << "+" << b << "=" << k << endl;
            }
        }
        //--------------------------------------------------------------
        //------------------------- METHOD 2 ---------------------------
        //--------------------------------------------------------------
        // what is 1 pass?
        /*
        A one-pass algorithm or single-pass algorithm is a
        streaming algorithm which reads its input exactly once. It does so by
        processing items in order, without unbounded buffering; it reads a block
        into an input buffer, processes it, and moves the result into an output
        buffer for each step in the process.
        SOURCE https://en.wikipedia.org/wiki/One-pass_algorithm#:~:text=In%20computing%2C%20a%20one%2Dpass,each%20step%20in%20the%20process.
        */
        if (method == 2)
        {   
            vector<int> vals(n);
            for (int i = 0; i < n; i++)
            {
                cout << "Insert integer number " << i + 1 << ": ";
                cin >> vals[i];
            }
            cout << "Insert k: ";
            cin >> k;

            cout << "\n##########################" << endl;
            cout << "###BETTER METHOD O(n)WC###  " << endl;
            cout << "##########################\n" << endl;
                 

            better_method(vals, k);
            if (not better_method)
                cout << "\nThere is no match";
        }
        //--------------------------------------------------------------
        //------------------------- KILL OR RESTART --------------------
        //--------------------------------------------------------------
        char opt;
        cout << "\nInsert r to restar\nInsert k to kill" << endl;
        cin >> opt;
        if (opt == 'k')
        {
            break;
        }
        else
        {
        }
    }
    return 0;
}