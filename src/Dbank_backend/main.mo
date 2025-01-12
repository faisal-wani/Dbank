import Debug "mo:base/Debug";
import Float "mo:base/Float";
import Time "mo:base/Time";



actor Dbank{

stable var currentprize:Float=300;   //orthogonal persistence
   // currentprize:=200;
stable var starttime=Time.now();
Debug.print(debug_show(starttime));
//let id=12345;
public func Topup(amount: Float)//update funtion
{  currentprize+=amount;
   Debug.print(debug_show(currentprize)); 
};
//candid makes UI interface to funtions to interact with
//run in  terminal:dfx canister id __Candid_UI
//get id, go to browser and paste it (http://127.0.0.1:4943/?canisterId=id u got)
//then it will ask u for program canister id 
//run in terminal dfx canister id Dbank,get id 
//then u can interact with the program functions from browser

public func withdraw(amount2: Float)//update funtion
{
     let tempvalue: Float=currentprize-amount2;

     if(tempvalue>=0)
     {
       currentprize-=amount2;
       Debug.print(debug_show(currentprize));
     }
     else{
      Debug.print("can not withdraw,insufficient balance");
     }
};

//query funtion
public query func checkbalance():async Float
{
     return currentprize;
};




public func compoundinterest()
{ let currenttime=Time.now();
  let timeelapsedNS=currenttime-starttime;
  let timeelapsedS=timeelapsedNS/1000000000;
  currentprize := currentprize*(1.01** Float.fromInt(timeelapsedS));
  starttime := currenttime;
};
 

}