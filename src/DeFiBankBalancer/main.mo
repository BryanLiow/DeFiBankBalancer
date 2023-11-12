import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DeFiBankBalancer {
  stable var currentBalance : Float = 300;
  stable var startTime = Time.now();
  stable var interestRate : Float = 0.1;

  Debug.print(debug_show (currentBalance));

  public func topUp(topUpAmount : Float) {
    currentBalance += topUpAmount;
    Debug.print(debug_show (currentBalance));
  };

  public func withdraw(withdrawAmount : Float) {
    let tempCurrentBalance : Float = currentBalance - withdrawAmount;
    if (tempCurrentBalance - withdrawAmount >= 0) {
      currentBalance -= withdrawAmount;
      Debug.print(debug_show (currentBalance));
    } else {
      Debug.print("Account don't have enough money to withdraw.");
    };
  };

  public query func checkBalance() : async Float {
    return currentBalance;
  };

  public query func checkInterestRate() : async Float {
    return interestRate;
  };

  public query func estimateBalanceAfterOneYear() : async Float {
    // Use the compound interest formula for a duration of one year
    let oneYear : Float = 1.0; // Duration of one year
    return currentBalance * (1.0 + interestRate) ** oneYear;
  };

  public func compoundInterest() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    // Convert nanoseconds to years (1 year = 365.25 days to account for leap years)
    let timeElapsedYears = Float.fromInt(timeElapsedNS) / 31_536_000_000_000_000.0;

    // Assuming the interest is compounded once a year (n = 1),
    // so the formula simplifies to P(1 + r)^t
    let annualInterestRate = interestRate;
    currentBalance := currentBalance * (1.0 + annualInterestRate) ** timeElapsedYears;
    Debug.print(debug_show (annualInterestRate));

    startTime := currentTime;
  };

  public func updateInterestRate(rate : Float) {
    interestRate := rate;
  };

};
