package src;

network FatTree16
{
    submodules:

        // ======================
        // CORE
        // ======================

        core: Router { @display("p=350,80"); }

        // ======================
        // AGGREGATION
        // ======================

        agg0: Router { @display("p=220,200"); }
        agg1: Router { @display("p=480,200"); }

        // ======================
        // EDGE
        // ======================

        edge0: Router { @display("p=120,340"); }
        edge1: Router { @display("p=260,340"); }

        edge2: Router { @display("p=440,340"); }
        edge3: Router { @display("p=580,340"); }

        // ======================
        // NODES
        // ======================

        node0: RingNode { @display("p=50,450"); }
        node1: RingNode { @display("p=90,520"); }

        node2: RingNode { @display("p=190,450"); }
        node3: RingNode { @display("p=230,520"); }

        node4: RingNode { @display("p=260,450"); }
        node5: RingNode { @display("p=300,520"); }

        node6: RingNode { @display("p=400,450"); }
        node7: RingNode { @display("p=440,520"); }

        node8: RingNode { @display("p=470,450"); }
        node9: RingNode { @display("p=510,520"); }

        node10: RingNode { @display("p=610,450"); }
        node11: RingNode { @display("p=650,520"); }

        node12: RingNode { @display("p=120,620"); }
        node13: RingNode { @display("p=260,620"); }

        node14: RingNode { @display("p=440,620"); }
        node15: RingNode { @display("p=580,620"); }


connections:

// ======================
// EDGE0
// ======================

node0.out++ --> { delay=50ms; } --> edge0.in++;
edge0.out++ --> { delay=50ms; } --> node0.in++;

node1.out++ --> { delay=50ms; } --> edge0.in++;
edge0.out++ --> { delay=50ms; } --> node1.in++;

node12.out++ --> { delay=50ms; } --> edge0.in++;
edge0.out++ --> { delay=50ms; } --> node12.in++;

node13.out++ --> { delay=50ms; } --> edge0.in++;
edge0.out++ --> { delay=50ms; } --> node13.in++;



// ======================
// EDGE1
// ======================

node2.out++ --> { delay=50ms; } --> edge1.in++;
edge1.out++ --> { delay=50ms; } --> node2.in++;

node3.out++ --> { delay=50ms; } --> edge1.in++;
edge1.out++ --> { delay=50ms; } --> node3.in++;

node4.out++ --> { delay=50ms; } --> edge1.in++;
edge1.out++ --> { delay=50ms; } --> node4.in++;

node5.out++ --> { delay=50ms; } --> edge1.in++;
edge1.out++ --> { delay=50ms; } --> node5.in++;



// ======================
// EDGE2
// ======================

node6.out++ --> { delay=50ms; } --> edge2.in++;
edge2.out++ --> { delay=50ms; } --> node6.in++;

node7.out++ --> { delay=50ms; } --> edge2.in++;
edge2.out++ --> { delay=50ms; } --> node7.in++;

node8.out++ --> { delay=50ms; } --> edge2.in++;
edge2.out++ --> { delay=50ms; } --> node8.in++;

node9.out++ --> { delay=50ms; } --> edge2.in++;
edge2.out++ --> { delay=50ms; } --> node9.in++;



// ======================
// EDGE3
// ======================

node10.out++ --> { delay=50ms; } --> edge3.in++;
edge3.out++ --> { delay=50ms; } --> node10.in++;

node11.out++ --> { delay=50ms; } --> edge3.in++;
edge3.out++ --> { delay=50ms; } --> node11.in++;

node14.out++ --> { delay=50ms; } --> edge3.in++;
edge3.out++ --> { delay=50ms; } --> node14.in++;

node15.out++ --> { delay=50ms; } --> edge3.in++;
edge3.out++ --> { delay=50ms; } --> node15.in++;



// ======================
// EDGE → AGG
// ======================

edge0.out++ --> { delay=150ms; } --> agg0.in++;
agg0.out++ --> { delay=150ms; } --> edge0.in++;

edge1.out++ --> { delay=150ms; } --> agg0.in++;
agg0.out++ --> { delay=150ms; } --> edge1.in++;

edge2.out++ --> { delay=150ms; } --> agg1.in++;
agg1.out++ --> { delay=150ms; } --> edge2.in++;

edge3.out++ --> { delay=150ms; } --> agg1.in++;
agg1.out++ --> { delay=150ms; } --> edge3.in++;



// ======================
// AGG → CORE
// ======================

agg0.out++ --> { delay=250ms; } --> core.in++;
core.out++ --> { delay=250ms; } --> agg0.in++;

agg1.out++ --> { delay=250ms; } --> core.in++;
core.out++ --> { delay=250ms; } --> agg1.in++;
}
