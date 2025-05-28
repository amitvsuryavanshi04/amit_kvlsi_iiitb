module string_methods_demo;

  // Declare two strings
  string str1, str2;
   string concat_str;

  // Temporary variables
  int char_code;
  byte ch;

  initial begin
    // Initialize the strings
    str1 = "amit";
    str2 = "futurewiz";

    $display("Initial Strings:");
    $display("str1 = %s", str1);
    $display("str2 = %s", str2);

    // Display lengths
    $display("\nLength of str1 = %0d", str1.len());
    $display("Length of str2 = %0d", str2.len());

    // Convert str1 to uppercase
    str1.toupper();
    $display("\nstr1 after toupper() = %s", str1);

    // Concatenate str1 and str2
    concat_str = {str1, "_", str2};
    $display("\nConcatenated string = %s", concat_str);

    // Get ASCII value of character at index 2 in str2
    char_code = str2.getc(2);
    $display("\nCharacter at index 2 of str2 = %c (ASCII = %0d)", char_code, char_code);

    // Replace character at index 0 in str2 with 'F'
    str2.putc(0, "F");
    $display("\nstr2 after putc(0, 'F') = %s", str2);

    // Get a character from str1 using getc
    ch = str1.getc(1);
    $display("\nCharacter at index 1 of str1 = %c", ch);

    // Replace character at index 1 in str1 with 'Z'
    str1.putc(1, "Z");
    $display("str1 after putc(1, 'Z') = %s", str1);
  end

endmodule
