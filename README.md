# parallel_processing
# MPI_Allgather Simulation on Dragonfly-Inspired Topology using OMNeT++

This project presents the simulation of MPI_Allgather collective communication algorithms on Dragonfly-inspired network topologies using the OMNeT++ discrete event simulation framework.

Both naive and ring-based communication approaches were implemented and evaluated on scalable hierarchical topologies consisting of 16 compute nodes and 4 interconnected routers.

The project focuses on packet-level communication behavior, routing strategies, latency analysis, and scalability characteristics in distributed systems.

---

# Project Structure

```text
parallel_processing/
│
├── src/
│   ├── Dragonfly16.ned
│   ├── RingDragonfly16.ned
│   ├── Node.cc
│   ├── RingNode.cc
│   ├── Router.cc
│   ├── NaiveRouter.cc
│   └── NaiveRouter.ned
│
├── simulations/
│   └── omnetpp.ini
│
├── rep/
│   ├── report.pdf
│   └── screenshots/
│
└── README.md

Implemented Algorithms
Naive MPI_Allgather

The naive implementation directly forwards packets to multiple outgoing connections using broadcast-style routing. Although simple, this approach generates excessive packet duplication and communication overhead in large-scale systems.

Network:

src.Dragonfly16
Ring-Based MPI_Allgather

The ring-based implementation uses deterministic forwarding between neighboring nodes and routers in a logical ring structure. This method reduces unnecessary packet duplication and improves scalability.

Network:

src.RingDragonfly16
Topology Design

The implemented Dragonfly-inspired topology includes:

16 compute nodes
4 hierarchical routers
Local node-router links
Global inter-router links
Hierarchical packet forwarding

The topology simulates scalable communication behavior in distributed high-performance computing systems.

Technologies Used
OMNeT++
C++
Discrete Event Simulation
Packet-Level Routing Simulation
Performance Metrics

The simulations analyze:

Packet transmission count
Packet reception count
Communication latency
Hop count
Routing behavior
Scalability characteristics
Build Instructions

First load the OMNeT++ environment:

cd ~/Downloads/omnetpp-6.4.0
source setenv

Then build the project:

cd samples/DragonflyAllgather

opp_makemake -f --deep -o DragonflyAllgather

make MODE=debug
Run Simulation
cd simulations

../DragonflyAllgather_dbg -m -u Qtenv -n .. omnetpp.ini
Example Results

Final ring-based simulation statistics:

Total Packets Sent: 960
Total Packets Received: 192
Average Latency: 0.35
Simulation Time: 20s

The naive implementation generated significantly larger communication traffic due to packet duplication, while the ring-based implementation provided more scalable routing behavior.

References
MPI Standard Documentation
OMNeT++ Simulation Framework
Dragonfly Topology Research Papers
High Performance Computing Communication Literature
