package src;

network RingDragonfly16
{
    submodules:

        // =========================
        // GROUP A
        // =========================

        routerA: Router { @display("p=200,150"); }

        node0: RingNode { @display("p=80,80"); }
        node1: RingNode { @display("p=80,140"); }
        node2: RingNode { @display("p=80,200"); }
        node3: RingNode { @display("p=80,260"); }

        // =========================
        // GROUP B
        // =========================

        routerB: Router { @display("p=500,150"); }

        node4: RingNode { @display("p=620,80"); }
        node5: RingNode { @display("p=620,140"); }
        node6: RingNode { @display("p=620,200"); }
        node7: RingNode { @display("p=620,260"); }

        // =========================
        // GROUP C
        // =========================

        routerC: Router { @display("p=200,450"); }

        node8: RingNode { @display("p=80,380"); }
        node9: RingNode { @display("p=80,440"); }
        node10: RingNode { @display("p=80,500"); }
        node11: RingNode { @display("p=80,560"); }

        // =========================
        // GROUP D
        // =========================

        routerD: Router { @display("p=500,450"); }

        node12: RingNode { @display("p=620,380"); }
        node13: RingNode { @display("p=620,440"); }
        node14: RingNode { @display("p=620,500"); }
        node15: RingNode { @display("p=620,560"); }

    connections:

        // =====================================
        // GROUP A
        // =====================================

        node0.out++ --> { delay = 50ms; } --> routerA.in++;
        routerA.out++ --> { delay = 50ms; } --> node0.in++;

        node1.out++ --> { delay = 50ms; } --> routerA.in++;
        routerA.out++ --> { delay = 50ms; } --> node1.in++;

        node2.out++ --> { delay = 50ms; } --> routerA.in++;
        routerA.out++ --> { delay = 50ms; } --> node2.in++;

        node3.out++ --> { delay = 50ms; } --> routerA.in++;
        routerA.out++ --> { delay = 50ms; } --> node3.in++;

        // =====================================
        // GROUP B
        // =====================================

        node4.out++ --> { delay = 50ms; } --> routerB.in++;
        routerB.out++ --> { delay = 50ms; } --> node4.in++;

        node5.out++ --> { delay = 50ms; } --> routerB.in++;
        routerB.out++ --> { delay = 50ms; } --> node5.in++;

        node6.out++ --> { delay = 50ms; } --> routerB.in++;
        routerB.out++ --> { delay = 50ms; } --> node6.in++;

        node7.out++ --> { delay = 50ms; } --> routerB.in++;
        routerB.out++ --> { delay = 50ms; } --> node7.in++;

        // =====================================
        // GROUP C
        // =====================================

        node8.out++ --> { delay = 50ms; } --> routerC.in++;
        routerC.out++ --> { delay = 50ms; } --> node8.in++;

        node9.out++ --> { delay = 50ms; } --> routerC.in++;
        routerC.out++ --> { delay = 50ms; } --> node9.in++;

        node10.out++ --> { delay = 50ms; } --> routerC.in++;
        routerC.out++ --> { delay = 50ms; } --> node10.in++;

        node11.out++ --> { delay = 50ms; } --> routerC.in++;
        routerC.out++ --> { delay = 50ms; } --> node11.in++;

        // =====================================
        // GROUP D
        // =====================================

        node12.out++ --> { delay = 50ms; } --> routerD.in++;
        routerD.out++ --> { delay = 50ms; } --> node12.in++;

        node13.out++ --> { delay = 50ms; } --> routerD.in++;
        routerD.out++ --> { delay = 50ms; } --> node13.in++;

        node14.out++ --> { delay = 50ms; } --> routerD.in++;
        routerD.out++ --> { delay = 50ms; } --> node14.in++;

        node15.out++ --> { delay = 50ms; } --> routerD.in++;
        routerD.out++ --> { delay = 50ms; } --> node15.in++;

        // =====================================
        // GLOBAL LINKS
        // =====================================

        routerA.out++ --> { delay = 250ms; } --> routerB.in++;
        routerB.out++ --> { delay = 250ms; } --> routerA.in++;

        routerA.out++ --> { delay = 250ms; } --> routerC.in++;
        routerC.out++ --> { delay = 250ms; } --> routerA.in++;

        routerB.out++ --> { delay = 250ms; } --> routerD.in++;
        routerD.out++ --> { delay = 250ms; } --> routerB.in++;

        routerC.out++ --> { delay = 250ms; } --> routerD.in++;
        routerD.out++ --> { delay = 250ms; } --> routerC.in++;
}