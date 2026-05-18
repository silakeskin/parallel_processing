package src;

simple Node
{
    gates:
        input in[];
        output out[];
}

simple Router
{
    gates:
        input in[];
        output out[];
}

network DragonflyPlus
{
    submodules:

        // =========================
        // GROUP A
        // =========================
        node0: Node {
            @display("p=100,100");
        }

        node1: Node {
            @display("p=100,200");
        }

        routerA: Router {
            @display("p=250,150");
        }

        // =========================
        // GROUP B
        // =========================
        node2: Node {
            @display("p=500,100");
        }

        node3: Node {
            @display("p=500,200");
        }

        routerB: Router {
            @display("p=350,150");
        }

    connections:

        // =====================================
        // INTRA-GROUP CONNECTIONS (FAST LINKS)
        // =====================================

        // node0 <-> routerA
        node0.out++ --> { delay = 50ms; } --> routerA.in++;
        routerA.out++ --> { delay = 50ms; } --> node0.in++;

        // node1 <-> routerA
        node1.out++ --> { delay = 50ms; } --> routerA.in++;
        routerA.out++ --> { delay = 50ms; } --> node1.in++;

        // node2 <-> routerB
        node2.out++ --> { delay = 50ms; } --> routerB.in++;
        routerB.out++ --> { delay = 50ms; } --> node2.in++;

        // node3 <-> routerB
        node3.out++ --> { delay = 50ms; } --> routerB.in++;
        routerB.out++ --> { delay = 50ms; } --> node3.in++;

        // =====================================
        // INTER-GROUP GLOBAL LINK
        // =====================================

        routerA.out++ --> { delay = 250ms; } --> routerB.in++;
        routerB.out++ --> { delay = 250ms; } --> routerA.in++;
}