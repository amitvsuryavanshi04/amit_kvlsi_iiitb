# MUX 4x1 Functional Verification (SystemVerilog)

![MUX Verification Flow]()

This project demonstrates the functional verification of a 4x1 multiplexer using SystemVerilog. The testbench architecture is modular and built using basic OOP concepts without relying on UVM.

## Verification Architecture Overview

- **Design**: The DUT is a 4x1 multiplexer (`mux_4x1`) with 4 inputs, 2 select lines, and 1 output.
- **Interface**: Used to group DUT ports for cleaner connectivity between design and testbench components.
- **Transaction**: Encapsulates input-output combinations used for stimulus generation and checking.
- **Generator**: Randomizes transactions and sends them to the driver.
- **Driver**: Applies input signals from the transaction to the DUT via the interface.
- **Monitor**: Captures DUT activity and sends observed data to the scoreboard.
- **Scoreboard**: Compares DUT output against expected output and reports PASS/FAIL.
- **Environment**: Instantiates and connects generator, driver, monitor, and scoreboard.

## Summary

The verification flow uses mailboxes for communication and a layered architecture to ensure reusable, maintainable testbench code.
