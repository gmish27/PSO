# PSO
Implementation of Particle Swarm Optimization in Matlab

This implementation is an attempt to augment the social behavior of a team working together to achive a goal. The complete model has been implemented using different small modules in matlab. Below is a brief description of them:

CONTROL.M -> The module provides the initial parameters to the model in order to define the search domain, initial random velocity of swarm particles, random placement of swarm particles, number of dimensions in which the particles move etc.

FITNESS_FUNCTION.M -> The module defines the fitness function that basically defines the goal the specifies number of swarm particles have to reach in a given amount of time.

INITIALIZE_PSO.M -> The module helps the model to initialize the complete working domain of the swarm particles using the parameters provided through CONTROL.>M module above. In general I have kept the starting point of any variable, in a dimension, from origin (non-negative), which can obviously be altered as needed.

CHECK.M -> The module aims at authenticating current position of a swarm particle at a certain instant of time so that the particle does’nt leaves the specified search domain. If it does, this module takes care of instructing the PSO_CORE.M module to pull back the particle back and put it to work back with other team members.

PSO_CORE.M -> The module is the top module of the complete model. The core algorithm has been implemented using this module. From updating the current position of involved team members to rendering them their new velocities to fly- all these modifications are implemented using this section.

GRAPH.M -> This module produces the resultant performance graph of overall collaborative work performed by the swarm particles.

MOVE.M -> The module helps in plotting the movement of particles in the given dimensions dynamically with each update made in position or velocity of a swarm particle.

Said all this let’s move on to a basic example as illustrated below:

The example fitness function that I am gonna take is : f(Z) = sin(p)/p + sin(q)/q + sin(r)/r where the initail values, asked by CONTRO.M are:-

No. of iterations = 300

No. of particles = 30

No. of dimensions = 3

Range of dimension 1 (p) = 50

Range of dimension 2 (q) = 10

Range of dimension 3 (r) = 50

NOTE: I have used 300 iterations and a teamwork of around 30 swarm particles as the chosen fitness function is quite oscillatory. In order to visualise the movement of particles during the execution of the program answer with a ‘y’ to whether to display each movement or not.

So with this example I aim to maximise the function f(Z) whose maximum value, as you must have thought, is 3. Using the above algorithm the best I got is 2.998200 which is quite close to the theoretical one. below I attach certain images to let you know about the simulation preview.

![Alt text](https://algoboy.files.wordpress.com/2011/11/pso_graph.jpg "PSO GRAPH")

This graph illustrates movement of swarm particles in a dimension. It depicts how finally the particles all gather together on one position, the point which yields maximum value of the fitness function.

![Alt text] (https://algoboy.files.wordpress.com/2011/11/pso_iteration1.jpg)

The above 3D plot shows the position of 30 swarm particles, all at random locations but searching for the same maximum value of the provided fitness function.

![Alt test] (https://algoboy.files.wordpress.com/2011/11/pso_iteration300.jpg)

And finally this is the plot that you get to see in the end, when all the iterations executed successfully. As you can see, the particles have aligned themselves on three fixed coordinate values in the given three dimensions.
