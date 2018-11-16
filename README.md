# Explicit Sequence Proximity Models for Hidden State Identification
This repository provides official code base for the paper "Explicit Sequence Proximity Models for Hidden State Identification".

## Recommended Systems
* Ubuntu 16.04
* Matlab
* Robotics System Toolbox
* Gazebo7
## Training and Testing
Clone this repository using following command
```
git clone https://github.com/SharathRaparthy/explicit_sequence_proximity.git
```
Also clone the following repository to simulate the E-Puck robot in gazebo. (Follow the instructions mentioned in README file)
```
git clone https://github.com/SharathRaparthy/Epuck-Robot-Gazebo.git
```

Open your terminal and execute the following command to start the training of E-Puck robot in gazebo simulator

```
matlab -r 'NSMExperiment(80,40)'
```
Here number of trails are 80 and number of episodes in each trial are 40.
