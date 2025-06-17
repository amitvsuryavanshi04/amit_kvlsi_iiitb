
# ✅ MUX41_Verification_Architecture

![MUX41 Simulation](./images/mux41_waveform.gif)

Welcome to the SystemVerilog-based **4x1 Multiplexer (MUX41)** functional verification project.  
This repository demonstrates a modular, UVM-style testbench built using pure SystemVerilog constructs like classes, interfaces, randomization, and mailbox communication.

---

## 📘 Design Under Test (DUT) — `mux41.sv`

```systemverilog
module mux41 (
  input  logic [3:0] a,
  input  logic [1:0] sel,
  output logic       y
);
  always_comb begin
    case (sel)
      2'b00: y = a[0];
      2'b01: y = a[1];
      2'b10: y = a[2];
      2'b11: y = a[3];
    endcase
  end
endmodule
```

---

## 📐 Interface — `mux_if.sv`

```systemverilog
interface mux_if;
  logic [3:0] a;
  logic [1:0] sel;
  logic       y;
endinterface
```

---

## 📦 Transaction — `transaction.sv`

```systemverilog
class transaction;
  rand bit [3:0] a;
  rand bit [1:0] sel;
       bit       y;

  function void display(string tag);
    $display("[%s] a = %b, sel = %b, y = %b", tag, a, sel, y);
  endfunction
endclass
```

---

## 🧠 Generator — `generator.sv`

```systemverilog
class mux_generator;
  mailbox gen2drv;
  transaction tr;

  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction

  task main();
    repeat (10) begin
      tr = new();
      assert(tr.randomize());
      gen2drv.put(tr);
    end
  endtask
endclass
```

---

## 🚗 Driver — `driver.sv`

```systemverilog
class mux_driver;
  virtual mux_if vif;
  mailbox gen2drv;
  transaction tr;

  function new(mailbox gen2drv, virtual mux_if vif);
    this.gen2drv = gen2drv;
    this.vif     = vif;
  endfunction

  task main();
    repeat (10) begin
      gen2drv.get(tr);
      vif.a   <= tr.a;
      vif.sel <= tr.sel;
      #2;
      tr.display("DRV_MUX");
    end
  endtask
endclass
```

---

## 👁️ Monitor — `monitor.sv`

```systemverilog
class mux_monitor;
  virtual mux_if vif;
  mailbox mon2sb;
  transaction tr;

  function new(mailbox mon2sb, virtual mux_if vif);
    this.mon2sb = mon2sb;
    this.vif    = vif;
  endfunction

  task main();
    repeat (10) begin
      tr      = new();
      tr.a    = vif.a;
      tr.sel  = vif.sel;
      tr.y    = vif.y;
      #2;
      tr.display("MON_MUX");
      mon2sb.put(tr);
    end
  endtask
endclass
```

---

## 🎯 Scoreboard — `scoreboard.sv`

```systemverilog
class mux_scoreboard;
  mailbox mon2sb;
  transaction tr;

  function new(mailbox mon2sb);
    this.mon2sb = mon2sb;
  endfunction

  function bit expected_output(bit [3:0] a, bit [1:0] sel);
    case (sel)
      2'b00: return a[0];
      2'b01: return a[1];
      2'b10: return a[2];
      2'b11: return a[3];
    endcase
  endfunction

  task main();
    repeat (10) begin
      mon2sb.get(tr);
      bit exp = expected_output(tr.a, tr.sel);

      if (tr.y === exp)
        $display("✅ TEST PASSED: a = %b, sel = %b, y = %b", tr.a, tr.sel, tr.y);
      else
        $error("❌ TEST FAILED: a = %b, sel = %b, expected y = %b, got y = %b", tr.a, tr.sel, exp, tr.y);
    end
  endtask
endclass
```

---

## 🌐 Environment — `environment.sv`

```systemverilog
class mux_env;
  mux_generator gen;
  mux_driver    drv;
  mux_monitor   mon;
  mux_scoreboard sb;

  mailbox gen2drv = new();
  mailbox mon2sb  = new();
  virtual mux_if vif;

  function new(virtual mux_if vif);
    this.vif = vif;
    gen = new(gen2drv);
    drv = new(gen2drv, vif);
    mon = new(mon2sb, vif);
    sb  = new(mon2sb);
  endfunction

  task run();
    fork
      gen.main();
      drv.main();
      mon.main();
      sb.main();
    join
  endtask
endclass
```

---

## 🧪 Testbench Top — `tb_mux41.sv`

```systemverilog
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "mux41.sv"

module tb;
  mux_if mif();
  mux41 dut (.a(mif.a), .sel(mif.sel), .y(mif.y));

  mux_env env;

  initial begin
    env = new(mif);
    env.run();
    #50 $finish;
  end
endmodule
```

---

## ✅ Output Example

```
[DRV_MUX] a = 1010, sel = 10, y = x
[MON_MUX] a = 1010, sel = 10, y = 1
✅ TEST PASSED: a = 1010, sel = 10, y = 1
...
❌ TEST FAILED: a = 1001, sel = 01, expected y = 0, got y = 1
```

---

## 📂 Directory Structure

```
MUX41_Verification/
├── mux41.sv
├── mux_if.sv
├── transaction.sv
├── generator.sv
├── driver.sv
├── monitor.sv
├── scoreboard.sv
├── environment.sv
├── tb_mux41.sv
├── README.md
└── images/
    └── mux41_waveform.gif
```

---

## 📎 License

This project is open-source under the MIT License.  
Feel free to use and modify for academic or professional use.
