import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  currentValue := 100;

  Debug.print(debug_show(currentValue));
  //debug_show is used to convert print (which prints only strings) to printing integers
}