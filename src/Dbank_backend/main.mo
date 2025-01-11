import Debug "mo:base/Debug";

actor Dbank{

var currentprize=300;
   // currentprize:=200;

//let id=12345;
public func Topup()
{  currentprize+=40;
   Debug.print(debug_show(currentprize)); 
};

//Topup();

 

}