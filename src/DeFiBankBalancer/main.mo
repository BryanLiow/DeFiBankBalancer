import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor DeFiBankBalancer {
  var currentBalance = 300;
  currentBalance := 100;

  Debug.print(debug_show (currentBalance));
 };
