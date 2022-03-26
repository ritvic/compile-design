#include<bits/stdc++.h>

using namespace std;



vector<string> LHS;
vector<vector<string>> RHS;
vector<string> input;

void getLHS(string aux){

    string lhs = to_string(aux[0]);
    LHS.push_back(lhs);

}


void getRHS(string aux){

    vector<string> rhsOperators;

    string rhs = to_string(aux[2]);
    rhsOperators.push_back(rhs);

    rhs = to_string(aux[4]);   
    rhsOperators.push_back(rhs); 

    RHS.push_back(rhsOperators);
}

bool search(string lhs, vector<string> rhs){

    for(int i=0;i<rhs.size();i++){
        if(rhs[i] == lhs)
            return true;
    }

    return false;
}

void solve(){
    
    int numberOfLines;
    cin>>numberOfLines;

    for(int i=0;i<numberOfLines;i++){
        string aux;
        cin>>aux;

        input.push_back(aux);
        getLHS(aux);
        getRHS(aux);
    }

    for(int i=0;i<LHS.size();i++){

        bool useFulCode = false;
        string lhs = LHS[i];
        for(int j=i+1;j<RHS.size();j++){
            
            useFulCode = search(lhs,RHS[j]);
            if(useFulCode) break;
        }

        if(!useFulCode){
            input[i] = "";
        }
    }

    for(int i=0;i<input.size();i++){
        
        cout<<input[i]<<"\n";
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