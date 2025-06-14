// Singleton class definition
class Singleton;
  static Singleton instance = null; // Static instance

  // Private constructor
  local function new();
    $display("Constructor called");
  endfunction

  // Static method to return the single instance
  static function Singleton get_instance();
    if (instance == null)
      instance = new();
    return instance;
  endfunction

  // A simple method to show it's working
  function void show();
    $display("Singleton object is working");
  endfunction
endclass

// Testbench
module test_singleton;
  Singleton s1, s2;

  initial begin
    s1 = Singleton::get_instance();
    s1.show();

    s2 = Singleton::get_instance();
    s2.show();

    // Check if both are same
    if (s1 == s2)
      $display("Same instance");
    else
      $display("Different instances");
  end
endmodule
