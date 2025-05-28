module test;

  // Declare an array of anonymous struct for student ID card details
  struct {
    string name;
    string f_name;
    string contact;
    string blood_group;
  } a[3]; // Array of 3 student entries

  initial begin
    // Assign values to the struct array
    a[0] = '{"Mohan", "XYZ", "12345", "O+ve"};
    a[1] = '{"Amit", "WZT", "2345", "B+ve"};
    a[2] = '{"Ashkit", "SDHT", "345", "O-ve"};

    // Display each student's details using %p
    $display("First Student details:");
    $display("%p", a[0]);

    $display("Second Student details:");
    $display("%p", a[1]);

    $display("Third Student details:");
    $display("%p", a[2]);
  end

endmodule
