CPU-Controlled MAC Accelerator with Memory-Mapped I/O (Verilog)

This project implements a simple multiply-accumulate (MAC) hardware accelerator integrated with a custom CPU using memory-mapped I/O.

The CPU writes operands to specific addresses, triggers computation, and reads the result back, demonstrating a complete CPU ↔ accelerator interaction flow.

System architecture: CPU ---> addr/data/write_enable -----> MAC_Accelerator ----> MAC_Unit ------> read_data (connected with CPU)

Control FSM: IDLE (waits for system to start), COMPUTE (performs multiply-accumulate), DONE (outputs result and assigns done)

Applications: MAC Unit is fundamental to matrix multiplacation and neural networks
