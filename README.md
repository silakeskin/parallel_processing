# parallel_processing

# MPI_Allgather Simulation on Dragonfly+ and Fat Tree Topologies using OMNeT++

This project presents the simulation and evaluation of **MPI_Allgather collective communication algorithms** using the **OMNeT++ discrete event simulation framework**.

Two communication strategies were implemented and analyzed:

* **Naive MPI_Allgather**
* **Ring-Based MPI_Allgather**

The simulations were performed on a **Dragonfly-inspired hierarchical topology** and extended with an **additional Fat Tree topology experiment** for performance comparison.

The project focuses on:

* Packet-level communication behavior
* Routing strategies
* Communication latency
* Scalability analysis
* Hierarchical network topology evaluation

---

# Repository Structure

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
├── fat_tree/
│   ├── FatTree16.ned
│   ├── Router.cc
│   ├── RingNode.cc
│   └── omnetpp.ini
│
├── simulations/
│   └── omnetpp.ini
│
├── rep/
│   ├── report.pdf
│   └── screenshots/
│
└── README.md
```

---

# Implemented Algorithms

## Naive MPI_Allgather

The naive implementation forwards packets directly to multiple outgoing connections using a broadcast-style communication mechanism.

Characteristics:

* Simple implementation
* High packet duplication
* Increased communication overhead
* Limited scalability

Network:

```text
src.Dragonfly16
```

---

## Ring-Based MPI_Allgather

The ring-based implementation forwards packets sequentially through neighboring nodes and routers using deterministic routing behavior.

Characteristics:

* Reduced packet duplication
* Improved communication efficiency
* More scalable communication pattern

Network:

```text
src.RingDragonfly16
```

---

# Additional Experiment — Fat Tree Topology

As an additional comparison experiment, MPI_Allgather communication was also evaluated using a simplified **Fat Tree topology**.

Characteristics:

* Hierarchical multi-level routing
* Reduced processed event count
* Alternative scalable communication structure

Network:

```text
src.FatTree16
```

---

# Topology Design

## Dragonfly+

* 16 compute nodes
* 4 hierarchical routers
* Local node-router communication
* Global router-router links

## Fat Tree

* 16 compute nodes
* Core–Aggregation–Edge hierarchy
* Hierarchical packet forwarding

---

# Technologies Used

* OMNeT++
* C++
* Discrete Event Simulation
* Packet-Level Routing
* MPI Collective Communication

---

# Performance Metrics

The simulations evaluate:

* Packet transmission count
* Packet reception count
* Communication latency
* Hop count
* Routing behavior
* Scalability characteristics

---

# Build Instructions

Load OMNeT++:

```bash
cd ~/Downloads/omnetpp-6.4.0

source setenv
```

Build project:

```bash
cd samples/DragonflyAllgather

make MODE=debug
```

Run simulation:

```bash
cd simulations

../DragonflyAllgather_dbg -m -u Qtenv -n .. omnetpp.ini
```

---

# Example Results

## Ring-Based Dragonfly+

| Metric                 | Value |
| ---------------------- | ----- |
| Total Packets Sent     | 960   |
| Total Packets Received | 192   |
| Average Latency        | 0.35  |
| Simulation Time        | 20 s  |

## Additional Fat Tree Experiment

| Metric            | Value      |
| ----------------- | ---------- |
| Processed Events  | 1724       |
| Packet Completion | Successful |
| Simulation Time   | 1 s        |

---

# Report

Project report:
Tis repository also contains the project report.

---

# References

1. MPI: A Message-Passing Interface Standard (MPI Forum)
2. OMNeT++ Simulation Framework
3. Dragonfly Topology Research
4. High Performance Computing Communication Systems
5. Interconnection Network Design Literature
