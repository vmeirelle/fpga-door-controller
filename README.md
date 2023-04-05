# Lock Controller Module

The Lock Controller Module is designed to implement a simple lock controller that requires the user to enter a two-digit access code to unlock the system. The user inputs the access code serially using two input bits (a and b) and a dedicated enter signal. If the correct access code is entered, the system outputs a signal (out) to unlock the door. If the access code is incorrect, the system sets an error signal (err). The system can be reset at any time using a dedicated reset signal (rst).

## State Machine

The Lock Controller Module is implemented using a state machine, which is a type of sequential logic circuit that operates based on the current state of the circuit and the inputs provided. In this particular case, the state machine is a Moore state machine, a type of state machine where the outputs depend only on the current state. In this case, the output signals of the state machine (out and err) are solely based on the current state (S2 and S4).

The Lock Controller Module has 5 states, as mentioned earlier:

S0: Initial state
S1: First key wrong
S2: Second key wrong
S3: First key correct
S4: Second key correct

In a Moore state machine, the output is defined for each state. In this case, the "out" signal is activated in the S4 state, indicating that the access code is correct and the door should be unlocked. The "err" signal is activated in the S2 state, indicating that an incorrect access code has been entered.

The state machine transitions from state to state based on the current state and the input signals. The logic for the next state is defined in the "always" block that checks the current state and the input signals.

The state machine resets to the initial state (S0) when the reset signal is activated. Overall, the state machine implements a simple lock controller with a two-digit access code requirement, with the outputs being solely based on the current state.

![Diagram](https://user-images.githubusercontent.com/50549048/229988102-5920d028-2d09-4620-a6ac-431cb58db260.png)



## How to Use

The Lock Controller Module can be used as a component in a larger digital system that requires a locking mechanism. The user must enter the two-digit access code serially, following the procedure outlined below:

1. Set KeyA to the first digit of the access code (either 0 or 1)
2. Set KeyB to the second digit of the access code (either 0 or 1)
3. Press the Enter button to input the digit and move to the next digit (if the first digit is already entered, it will go to the second digit).
4. Repeat steps 1-3 for the second digit of the access code.
5. If the entered code is correct, the Open signal will be triggered (Open=1) to unlock the door. If the entered code is incorrect, the Error signal will be activated (only after the second code has been entered).
6. At any time, the user can press the Reset button to restart the procedure.

## Code Attribution
This code was developed by @vmeirelle for educational purposes. You are free to use and modify this code for your own projects. If you found this code helpful, please consider giving credit to the original author.
