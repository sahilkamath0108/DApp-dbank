import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 200;
  currentValue := 0;

  stable var startTime = Time.now();
  startTime := Time.now();
  // Debug.print(debug_show(startTime));

  Debug.print(debug_show(currentValue));
  //debug_show is used to convert print (which prints only strings) to printing integers

  public func topUp(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue))
  };

  public func withdraw(amount: Float){
    if(amount<=currentValue){
      currentValue -= amount;
      Debug.print(debug_show(currentValue))
    }else{
      Debug.print("Insufficient balance!");
      Debug.print(debug_show(currentValue))
    }
    
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS =  timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };

}