package src;

simple RingNode
{
    gates:
        input in[];
        output out[];
}

network RingDragonflyPlus
{
    submodules:

        node0: RingNode {
            @display("p=100,150");
        }

        node1: RingNode {
            @display("p=250,150");
        }

        node2: RingNode {
            @display("p=400,150");
        }

        node3: RingNode {
            @display("p=550,150");
        }

    connections:

        node0.out++ --> { delay = 80ms; } --> node1.in++;
        node1.out++ --> { delay = 80ms; } --> node2.in++;
        node2.out++ --> { delay = 80ms; } --> node3.in++;
        node3.out++ --> { delay = 80ms; } --> node0.in++;
}