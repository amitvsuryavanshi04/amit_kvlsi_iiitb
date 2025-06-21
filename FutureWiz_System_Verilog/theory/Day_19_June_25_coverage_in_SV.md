
# 📘 Coverage in SystemVerilog

SystemVerilog verification environments rely on **coverage metrics** to assess how effectively a design has been tested. Coverage allows you to measure the thoroughness of testbenches and understand whether critical functionality has been exercised.

There are two major types of coverage in SystemVerilog:

- **Code Coverage**
- **Functional Coverage**

---

## ✅ i) Code Coverage

**Code coverage** is automatically collected by the simulator and tells you *how much of your source code* has been executed during simulation. It ensures that all parts of the design code are touched by your testbench.

### 🔍 Types of Code Coverage

---

### 1. 📄 Statement Coverage

Checks whether **each line of executable code** has been executed.

#### Example:
```systemverilog
if (a > b)
  x = 1;
else
  x = 0;
```
Statement coverage ensures both `x = 1` and `x = 0` lines were executed.

---

### 2. 🔁 Branch Coverage

Determines if **all possible branches** (true/false paths) of conditionals were taken.

#### Example:
```systemverilog
if (enable)
  out = data;
```
Branch coverage is complete only if tests run both with `enable = 1` and `enable = 0`.

---

### 3. ☑️ Condition Coverage

Examines **each Boolean sub-expression** inside conditionals.

#### Example:
```systemverilog
if ((a && b) || c)
  y = 1;
```
Condition coverage checks all combinations of:

- `a = 1/0`
- `b = 1/0`
- `c = 1/0`

---

### 4. 🔀 Toggle Coverage

Monitors **whether a signal transitions** from `0 → 1` and `1 → 0`.

#### Example:
```systemverilog
reg clk;
always #5 clk = ~clk;
```
Toggle coverage checks both high-to-low and low-to-high transitions for `clk`.

---

### 5. 🧠 FSM State Coverage

Applies to **finite state machines** — ensures **every state** in the FSM was visited.

#### Example:
```systemverilog
typedef enum logic [1:0] {IDLE, READ, WRITE, DONE} state_t;
state_t curr_state;
```
State coverage checks that all 4 states are entered during simulation.

---

### 6. 🔁 Transition Coverage

Checks **transitions between states** in FSMs.

#### Example:
```
IDLE → READ → WRITE → DONE
```
Transition coverage ensures all valid transitions between FSM states occur during simulation.

---

### 📈 Enabling Code Coverage

To collect code coverage, use simulator options:

- **Synopsys VCS**: `vcs -cm line+cond+tgl+fsm`
- **Mentor Questa**: `vsim -coverage`
- **Cadence Xcelium**: `xrun -coverage`

After simulation, view coverage reports using:

- **Synopsys Verdi**
- **Mentor Questa Coverage**
- **Cadence IMC**

---

## 🎯 ii) Functional Coverage

**Functional coverage** is user-defined and based on **design intent** or **specifications**. It helps verify whether **key functional scenarios** have been tested, especially useful in **constrained-random verification (CRV)**.

---

### 🔧 Functional Coverage Example: Covergroups

```systemverilog
class myTrns;
  rand bit [3:0] mode;
  rand bit [1:0] key;

  covergroup CovGrp;
    coverpoint mode {
      bins featureA = {0};
      bins featureB = {[1:3]};
      bins common[] = {4:$};   // 4 to 15
      bins reserve = default;
    }
    coverpoint key;
  endgroup
endclass
```

---

### 📊 Sampling Covergroups

#### ➤ Manual Sampling

```systemverilog
initial begin
  myCov0.CovGrp.sample();  // Triggers sampling
end
```

#### ➤ Clock-Based Sampling

```systemverilog
covergroup CovGrp @(posedge clk);    // Sample at every posedge clk
```

---

### ⚙️ Conditional Sampling

#### Using `iff`

```systemverilog
coverpoint mode iff (!reset);
```

#### Using `start()` / `stop()`

```systemverilog
initial begin
  cg.stop();
  #10 cg.start();
end
```

---

### 🧪 Practical Example: Clock-Based Sampling

```systemverilog
module tb;

  bit [1:0] mode;
  bit [2:0] cfg;
  bit clk;

  always #20 clk = ~clk;

  covergroup cg @(posedge clk);
    cp_mode    : coverpoint mode;
    cp_cfg_10  : coverpoint cfg[1:0];
    cp_cfg_lsb : coverpoint cfg[0];
    cp_sum     : coverpoint (mode + cfg);
  endgroup

  cg cg_inst;

  initial begin
    cg_inst = new();
    for (int i = 0; i < 5; i++) begin
      @(negedge clk);
      mode = $random;
      cfg  = $random;
      $display("[%0t] mode=0x%0h cfg=0x%0h", $time, mode, cfg);
    end
  end

  initial begin
    #500 $display("Coverage = %0.2f %%", cg_inst.get_inst_coverage());
    $finish;
  end
endmodule
```

---

### 📂 Functional Coverage Reporting

To analyze and merge coverage:

- Use simulator-specific options (e.g., `-cm`, `-coverage`, etc.)
- Use tools like:
  - **Cadence IMC**
  - **Mentor Questa Coverage**
  - **Synopsys Verdi**

These tools allow you to merge multiple `.ucd` / `.cov` files and generate comprehensive reports.

---

## 📝 Summary Table

| Type                | Description                                             | Method       |
|---------------------|---------------------------------------------------------|--------------|
| Statement Coverage  | Every line of code executed                             | Simulator    |
| Branch Coverage     | All branches (`if`, `case`, loops) taken                | Simulator    |
| Condition Coverage  | Each Boolean sub-condition evaluated                    | Simulator    |
| Toggle Coverage     | Signal transitions from `0→1` and `1→0`                 | Simulator    |
| State Coverage      | All FSM states visited                                  | Simulator    |
| Transition Coverage | All FSM state-to-state transitions exercised            | Simulator    |
| Functional Coverage | Features and scenarios defined by the verification team | User-defined |

---

💡 **Tip**: Combine both **code** and **functional** coverage for full verification confidence.  
100% code coverage does **not** mean your design is completely tested — you must ensure all **features** and **use cases** are covered functionally.
