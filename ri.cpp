#include<bits/stdc++.h>
using namespace std;

unordered_map<char,int> var_num;
unordered_map<string,string> rhs_lhs;

string numberRHS(string s){
 string rhs="";
 for(i=2;i<s.length();i++){
     if(s[i]=='+' || s[i]=='-' || s[i]=='*' || s[i]=='/'){
         rhs=rhs+to_string(s[i]);
     }
     else{
         rhs= rhs+ s[i]+ to_string(var_num[s[i]]);
     }
 }
}
string numberLHS(string s){
 string lhs="";
 var_num[s[0]]=var_num[s[0]]+1;
 lhs=s[0]+to_string(var_num[s[0]]);
 return lhs;
}

void solve(){
    int n;
    cin>>n;
    for(int i=0;i<n;i++){
        string temp;
        cin>> temp;
        string lhs=numberLHS(temp);
        string rhs=numberRHS(temp);

        if(rhs_lhs[rhs]=""){
            rhs_lhs[rhs]=lhs;
            cout<<temp<<endl;
        }
        else{
            rhs_lhs[rhs_lhs[rhs]]=lhs;
            string Localrhs=rhs_lhs[rhs];
            cout<<lhs[0]<<"="<<Localrhs<[0]<endl;
        }
    }

}


int main(){
    freopen("input.txt","r",stdin);
    freopen("Error.txt","w",stderror);
    solve();
    return 0;
}