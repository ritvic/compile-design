#include<bits/stdc++.h>

using namespace std;


// #define fastio() ios_base::sync_with_stdio(false);cin.tie(NULL);cout.tie(NULL)
// #define MOD 1000000007
// #define MOD1 998244353
// #define INF 1e18
// #define nline "\n"
// #define pb push_back
// #define ppb pop_back
// #define mp make_pair
// #define ff first
// #define ss second
// #define PI 3.141592653589793238462
// #define set_bits __builtin_popcountll
// #define sz(x) ((int)(x).size())
// #define all(x) (x).begin(), (x).end()

// typedef long long ll;
// typedef unsigned long long ull;
// typedef long double lld;
// typedef vector<ll> vl;
// typedef vector<vl> vvl;
// typedef vector<int> vi;
// typedef vector<vi> vvi;
// typedef vector<char> vc;
// typedef vector<vc> vvc;
// typedef vector<vi> vvi;
// typedef vector<string> vs;


// #ifndef ONLINE_JUDGE
// #define debug(x) cerr << #x <<" "; _print(x); cerr << endl;
// #else
// #define debug(x)
// #endif

// void _print(ll t) {cerr << t;}
// void _print(int t) {cerr << t;}
// void _print(string t) {cerr << t;}
// void _print(char t) {cerr << t;}
// void _print(lld t) {cerr << t;}
// void _print(double t) {cerr << t;}
// void _print(ull t) {cerr << t;}

// template <class T, class V> void _print(pair <T, V> p);
// template <class T> void _print(vector <T> v);
// template <class T> void _print(set <T> v);
// template <class T, class V> void _print(map <T, V> v);
// template <class T> void _print(multiset <T> v);
// template <class T, class V> void _print(pair <T, V> p) {cerr << "{"; _print(p.ff); cerr << ","; _print(p.ss); cerr << "}";}
// template <class T> void _print(vector <T> v) {cerr << "[ "; for (T i : v) {_print(i); cerr << " ";} cerr << "]";}
// template <class T> void _print(set <T> v) {cerr << "[ "; for (T i : v) {_print(i); cerr << " ";} cerr << "]";}
// template <class T> void _print(multiset <T> v) {cerr << "[ "; for (T i : v) {_print(i); cerr << " ";} cerr << "]";}
// template <class T, class V> void _print(map <T, V> v) {cerr << "[ "; for (auto i : v) {_print(i); cerr << " ";} cerr << "]";}
// template <class T> void _print(vector<vector<T>> v){cerr<<"[ ";for(auto x:v){_print(x);cerr<<nline;}cerr<<" ]";}
// template <class T> void _print(stack <T> v) {cerr << "[ "; for (;v.size()!=0;) {_print(v.top()); cerr << " ";v.pop();} cerr << "]";}


unordered_map<char,int> variable_number;
unordered_map<string,string> rhs_lhs;

string numberRHS(string aux){

    string rhs = "";
    for(int i=2;i<aux.length();i++){

        if(aux[i] == '+' ||aux[i] == '-' ||aux[i] == '*' ||aux[i] == '/'){
            rhs = rhs + aux[i];
        }
        else {
            rhs = rhs + aux[i] + to_string(variable_number[aux[i]]);
        }
    }

    return rhs;
}

string numberLHS(string aux){

    string lhs = "";
    variable_number[aux[0]] = variable_number[aux[0]] + 1;
    lhs = aux[0] + to_string(variable_number[aux[0]]);

    return lhs;
}

void solve(){

    int numberOfLines;
    cin>>numberOfLines;
    
    
    for(int i=0;i<numberOfLines;i++){
        string aux;
        cin>>aux;

        string rhs = numberRHS(aux);
        string lhs = numberLHS(aux);

        if(rhs_lhs[rhs] == ""){
            rhs_lhs[rhs] = lhs;
            cout<<aux<<"\n";
        }
        else{
            rhs_lhs[rhs_lhs[rhs]] = lhs;
            string localRHS = rhs_lhs[rhs];
            string localLHS = lhs;

            cout<<localLHS[0]<<"="<<localRHS[0]<<"\n";
        }
    }

    
}

int main() {
    #ifndef ONLINE_JUDGE
        freopen("Error.txt", "w", stderr);
    #endif
    #ifndef ONLINE_JUDGE
        freopen("input.txt","r",stdin);
    #endif // !ONLINE_JUDGE
    
    // int T;
    // cin>>T;
    
    // while(T--)
        solve();
    return 0;
}