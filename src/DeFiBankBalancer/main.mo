import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor DeFiBankBalancer {
  var currentValue = 300;
  currentValue := 100;

  let val = 123321;
  Debug.print(debug_show (currentValue));
  Debug.print(debug_show (val));

  public func topUp(amount : Nat) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Nat) {
    let tempValue:Int = currentValue - amount;
    if (tempValue - amount >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    }else{
      Debug.print("Account dont have enough money to withdraw");

    }
  };

  // topUp();yesy
};
