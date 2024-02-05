---
tags:
- coding
- tcl/tk
---
# Examples

## Run simulation

[run_sim.do]({{config_repo_file}}/scripts/tcl_tk_do/hevs_example/run_sim.do)

This scripts performs the following operations:

1. Quit previous simulation if in action
2. Specify variables
    1. Get PWD
    2. Project path variables
    3. compPath form environmentvar
    4. workPath
    5. ModelsimPath
3. Creating working library
    1. Change to working directory
    2. Create work lib
    3. Change back to modelsim execution directory
    4. Mapping work lib
4. Compile Design
    1. Execute `comp.do` files
5. Compile Testbench
6. Loading the design
7. Load do files for simulation
8. Restart and Simulate

## Compilation

[comp.do]({{config_repo_file}}/scripts/tcl_tk_do/hevs_example/comp.do)

This scripts performs the following operations:

1. Specify variables of component
2. Specify VHDL source Paths
3. Specify Subcomponent Paths
4. Compile additional Libraries
5. Compile the Design

## Calculate Simulation time

[calc_simtime.do]({{config_repo_file}}/scripts/tcl_tk_do/calc_simtime.do)

This scripts allows to measure the simulation time
