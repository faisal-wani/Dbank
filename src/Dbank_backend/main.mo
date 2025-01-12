import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";

actor Dbank{

var currentprize=300;
   // currentprize:=200;

//let id=12345;
public func Topup(amount: Nat)
{  currentprize+=amount;
   Debug.print(debug_show(currentprize)); 
};
//candid makes UI interface to funtions to interact with
//run in  terminal:dfx canister id __Candid_UI
//get id, go to browser and paste it (http://127.0.0.1:4943/?canisterId=id u got)
//then it will ask u for program canister id 
//run in terminal dfx canister id Dbank,get id 
//then u can interact with the program functions from browser

public func withdraw(amount2: Nat)
{
     let tempvalue: Int=currentprize-amount2;

     if(tempvalue>=0)
     {
       currentprize-=amount2;
       Debug.print(debug_show(currentprize));
     }
     else{
      Debug.print("can not withdraw,insufficient balance");
     }
};
 

}