#include<bits/stdc++.h>

using namespace std;
int arr[100]={10 ,40 ,60, 70, 80};
int n=5;
string str[100]={"abcd", "eabcd", "xyzg", "zxys", "zzzz"};
int ns=5;

void xinsert(int item){
    int loc=n;
    for(int i=0; i<n; i++){
        if(item>arr[i]) continue;
        else{
            loc=i;
            break;
        }
    }
    for(int i=n-1; i>=loc; i--){
        arr[i+1]=arr[i];
    }
    arr[loc]=item;
    n++;
}

void xinsert(string item){
    int loc=n;
    for(int i=0; i<ns; i++){
        if(item>str[i]) continue;
        else{
            loc=i;
            break;
        }
    }
    for(int i=ns-1; i>=loc; i--){
        str[i+1]=str[i];
    }
    str[loc]=item;
    ns++;
}

void xinsert(int item, int loc){
    loc--;
    for(int i=n-1; i>=loc; i--){
        arr[i+1]=arr[i];
    }
    arr[loc]=item;
    n++;
}

void xinsert(string item, int loc){
    loc--;
    for(int i=ns-1; i>=loc; i--){
        str[i+1]=str[i];
    }
    str[loc]=item;
    ns++;
}

void xdelete(string item){
    int loc=ns;
    for(int i=0; i<ns; i++){
        if(str[i]==item){
            loc=i;
            break;
        }
    }
    for(int i=loc; i<ns-1; i++){
        str[i]=str[i+1];
    }
    ns--;
}

void sort(){
    for(int i=n-1; i>0; i--){
        for(int j=0; j<i; j++){
            if(arr[j]>arr[j+1]){
                int temp=arr[j];
                arr[j]=arr[j+1];
                arr[j+1]=temp;
            }
        }
    }
}

int main(){
    xinsert(54);
    cout<<"after inserting: ";
    for(int i=0; i<n; i++){
        cout<<arr[i]<<' ';
    }
    cout<<'\n';
    xinsert("rahim");
    cout<<"after inserting: ";
    for(int i=0; i<ns; i++){
        cout<<str[i]<<' ';
    }
    cout<<'\n';
    xinsert(99, 5);
    cout<<"after inserting: ";
    for(int i=0; i<n; i++){
        cout<<arr[i]<<' ';
    }
    cout<<'\n';
    xinsert("karim", 5);
    cout<<"after inserting: ";
    for(int i=0; i<ns; i++){
        cout<<str[i]<<' ';
    }
    cout<<'\n';
    xdelete("karim");
    cout<<"after deleting: ";
    for(int i=0; i<ns; i++){
        cout<<str[i]<<' ';
    }
    cout<<'\n';
    //enter item to sort
    for(int i=0; i<n; i++){
        cin>>arr[i];
    }
    sort();
    cout<<"after sorting: ";
    for(int i=0; i<n; i++) cout<<arr[i]<<' ';
    cout<<'\n';

}
