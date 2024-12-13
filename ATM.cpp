#include<iostream>
#include<vector>
using namespace std;

class ATM {
    private:
    float balance;
    int pincode;
    int success;

    public:
    ATM(float balance, int pincode) {
        this->balance = balance;
        this->pincode = pincode;
    }

    float getbalance() {
        return balance;
    }

    int withdrow(int amount, int pincode) {

        if(pincode!=pincode){
            return false;
        }

        if(amount>balance) {
            return false;

        } else {
            balance-=amount;
            return true;
        }
    }

    int deposite(int amount){
        balance+=amount;
    }

     int transfer(int amount, int pincode, ATM receiver){
        if(pincode != pincode){
            return false;
        }

        success = withdrow(amount, pincode);

        if(success){
            receiver.deposite(amount);
            return true;

        } else {
            return false;
        }
        
    }

};

class bankaccount {
    private:
    string name;
    int accountnumber;
    float balance;

    public:
    bankaccount(string name, int accountnumber, float balance){
        this->accountnumber = accountnumber;
        this->balance = balance;
        this->name = name;
    }

    string getname(){
        return name;
    }

    int getaccountnumber(){
        return accountnumber;
    }

    float getbalance(){
        return balance;
    }

};

class bankmanagement {
    private:
    vector<bankaccount> accounts;

    public:
    void addaccount(string name, int accountnumber, double balance){
        accounts.push_back(bankaccount(name,accountnumber,balance));
    }

    void showallaccount(){
        cout<<"all account holders"<<endl;
        for(int i=0; i<accounts.size(); i++){
            cout<<"Name: "<<accounts[i].getname()<<endl;
            cout<<"Account Number: "<<accounts[i].getaccountnumber()<<endl;
            cout<<"Balance: "<<accounts[i].getbalance()<<endl;
            cout<<endl;
        }
    }

    void searchaccount(int account){
        cout<<"Account Holder"<<endl;

        for(int i=0; i<accounts.size(); i++){
            if(accounts[i].getaccountnumber() == account){
            cout<<"Name: "<<accounts[i].getname()<<endl;
            cout<<"Account Number: "<<accounts[i].getaccountnumber()<<endl;
            cout<<"Balance: "<<accounts[i].getbalance()<<endl;
            cout<<endl;

            }
        }

    }
};

int main(){
    ATM ATM(100000,1756);
    bankmanagement bank;
    int choice, amount, success,pincode;
    char option;

    do{
    system("cls");
    cout<<"1.View Balance: "<<endl;
    cout<<"2.Cash Withdraw: "<<endl;
    cout<<"3.Cash Deposite: "<<endl;
    cout<<"4.Transfer Amount"<<endl;
    cout<<"5.create new account"<<endl;
    cout<<"6.show all account"<<endl;
    cout<<"7.Search account"<<endl;
    cout<<"8.EXIT"<<endl;

    cout<<"Enter Your Choice"<<endl;
    cin>>choice;

    switch(choice){
        case 1:
        cout<<"Your Balance "<<ATM.getbalance()<<endl;
        break;

        case 2:
        cout<<"Enter The Amount to Withdraw: "<<endl;
        cin>>amount;
        success = ATM.withdrow(amount,1756);

        if(success) {
            cout<<"withdraw successfully"<<endl;
        } else {
            cout<<"Aukot Me Raho"<<endl;
        }
        break;

        case 3:
        cout<<"Enter The amount to deposite"<<endl;
        cin>>amount;

        ATM.deposite(amount);
        cout<<"DePosite Successfully"<<endl;

        if(amount>10000){
            cout<<"Par Bhai Kha Se La Rha He Etna Pesa\nHame bhi bata de"<<endl;
        } else {
            cout<<"Chindi Thode Jayada Pese dal saale"<<endl;
        }
        break;

        case 4:
        cout<<"Enter the amount to transfer"<<endl;
        cin>>amount;

        cout<<"Enter the pin code"<<endl;
        cin>>pincode;

        success = ATM.transfer(amount,pincode,ATM);
            if(success){
                cout<<"amount transfer"<<endl;
            } else {
                cout<<"amount not transfer"<<endl;
            }
            
            break;

        case 5:{
        string name;
        int accountnumber;
        float balance;

        cout<<"Enter Name"<<endl;
        cin>>name;
        cout<<"Enter account number"<<endl;
        cin>>accountnumber;
        cout<<"Enter balance"<<endl;
        cin>>balance;

        bank.addaccount(name,accountnumber,balance);
        cout<<"bank account created successfully"<<endl;
        break;
        }

        case 6:
        bank.showallaccount();
        break;

        case 7:
        int accountnum;
        cout<<"Enter account number"<<endl;
        cin>>accountnum;
        bank.searchaccount(accountnum);
        break;

        case 8:
        cout<<"Jab kuch karna hi nhi tha to aaya kyu yaha "<<endl;
        break;


        default:
        cout<<"aankh Nakh khol kar pad msg ko"<<endl;
    }

    cout<<"Do You Want To try another transaction: Press Y or N "<<endl;
    cin>>option;

    if(option == 'N' || option == 'n') {
        break;;
        }
    }

    while (option == 'Y' || option == 'y');
    cout<<"Thanks for using the ATM visit again"<<endl;
    return 0;
}

//do system clear screen and while loop without condition it is new for me;