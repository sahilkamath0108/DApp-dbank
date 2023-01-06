import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  currentValue := 0;

  Debug.print(debug_show(currentValue));
  //debug_show is used to convert print (which prints only strings) to printing integers

  public func topUp(amount: Nat){
    currentValue += amount;
    Debug.print(debug_show(currentValue))
  };

  public func withdraw(amount: Nat){
    if(amount<=currentValue){
      currentValue -= amount;
      Debug.print(debug_show(currentValue))
    }else{
      Debug.print("Insufficient balance!");
      Debug.print(debug_show(currentValue))
    }
    
  };

  public query func checkBalance(): async Nat {
    return currentValue;
  };

}