# **SYNCHRONOUS FIFO – UVM Verification Project**

## **Overview**

This project implements and verifies a Synchronous FIFO (First-In-First-Out) using SystemVerilog and Universal Verification Methodology (UVM).

The verification environment is built using a dual-agent architecture:

One Write Agent

One Read Agent

Each agent operates independently with its own driver, sequencer, and monitor. A Virtual Sequencer and Virtual Sequence are used to coordinate read and write operations.

 ## **Architecture**
🔹 Design Features

Single clock (Synchronous FIFO)

Parameterized depth and width

Write Enable (wr_en)

Read Enable (rd_en)

Full and Empty flags

## **Verification Architecture**
🔹 Write Agent

Write Driver

Write Sequencer

Write Monitor

Responsible for generating and driving write transactions to the DUT.

🔹 Read Agent

Read Driver

Read Sequencer

Read Monitor

Responsible for generating and driving read transactions from the DUT.

## **Virtual Layer**
🔹 Virtual Sequencer

Connects:

Write Sequencer

Read Sequencer

Used to coordinate parallel or controlled execution of sequences.

🔹 Virtual Sequence

Controls:

Write Sequence

Read Sequence

Enables:

Simultaneous Read & Write

Controlled traffic scenarios

Synchronization between agents

## **PROJECT ARCHITECTURE**

 Test Scenarios Covered

Write-only operations

Read-only operations

Simultaneous Read & Write

FIFO Full condition

FIFO Empty condition

Random transaction testing

## **Scoreboard**

Captures write data as expected data

Captures read data as actual data

Compares both streams

Reports mismatches using UVM reporting mechanism

## **How to Run**


 ## **Key Highlights**

Dual-agent UVM architecture

Independent read/write stimulus generation

Virtual sequence coordination

Modular and scalable testbench design

Clear separation of concerns

## **Applications**

Data buffering systems

Digital communication modules

FPGA and ASIC verification

On-chip memory validation

### 👩‍💻 Author

**G Varsha
VLSI / Verification**
