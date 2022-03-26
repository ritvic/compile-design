#include <bits/stdc++.h>
using namespace std;

unordered_map<char, int> var_num;
unordered_map<string, string> rhs_lhs;

string numberRHS(string s)
{
    string rhs = "";
    for (int i = 2; i < s.length(); i++)
    {
        if (s[i] == '+' || s[i] == '-' || s[i] == '*' || s[i] == '/')
        {
            rhs = rhs + s[i];
        }
        else
        {
            rhs = rhs + s[i] + to_string(var_num[s[i]]);
        }
    }
    return rhs;
}
string numberLHS(string aux)
{
    string lhs = "";
    var_num[aux[0]] = var_num[aux[0]] + 1;
    lhs = aux[0] + to_string(var_num[aux[0]]);
    return lhs;
}

void solve()
{
    int n;
    cin >> n;
    for (int i = 0; i < n; i++)
    {
        string aux;
        cin >> aux;
        string rhs = numberRHS(aux);
        string lhs = numberLHS(aux);

        if (rhs_lhs[rhs] == "")
        {
            rhs_lhs[rhs] = lhs;
            cout << aux << endl;
        }
        else
        {
            rhs_lhs[rhs_lhs[rhs]] = lhs;
            string Localrhs = rhs_lhs[rhs];
            string localLHS = lhs;
            cout << localLHS[0] << "=" << Localrhs[0] << endl;
        }
    }
}

int main()
{
        freopen("Error.txt", "w", stderr);
    freopen("input.txt", "r", stdin);
    solve();
    return 0;
}