import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor DeFiBankBalancer {
  stable var currentBalance = 300;

  Debug.print(debug_show (currentBalance));

  public func topUp(amount : Nat) {
    currentBalance += amount;
    Debug.print(debug_show (currentBalance));
  };

  public func withdraw(amount : Nat) {
    let tempCurrentBalance : Int = currentBalance - amount;
    if (tempCurrentBalance - amount >= 0) {
      currentBalance -= amount;
      Debug.print(debug_show (currentBalance));
    } else {
      Debug.print("Account don't have enough money to withdraw.");
    };
  };

  public query func checkBalance() : async Nat {
    return currentBalance;
  };
};
