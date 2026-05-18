#include <omnetpp.h>

using namespace omnetpp;

class Node : public cSimpleModule
{
  private:

    static int totalPacketsSent;
    static int totalPacketsReceived;

    static double totalLatency;

  protected:

    virtual void initialize() override;

    virtual void handleMessage(cMessage *msg) override;

    virtual void finish() override;
};

Define_Module(Node);

// =========================================
// STATIC VARIABLES
// =========================================

int Node::totalPacketsSent = 0;

int Node::totalPacketsReceived = 0;

double Node::totalLatency = 0;

// =========================================
// INITIALIZE
// =========================================

void Node::initialize()
{
    EV << getName()
       << " started naive allgather at "
       << simTime()
       << "\n";

    // =====================================
    // SEND TO ALL DESTINATIONS
    // =====================================

    for (int i = 0; i < gateSize("out"); i++)
    {
        cMessage *msg = new cMessage("allgather_packet");

        msg->addPar("source") = getName();

        msg->addPar("creationTime") = simTime().dbl();

        msg->addPar("hopCount") = 0;

        send(msg, "out", i);

        totalPacketsSent++;

        EV << getName()
           << " sent packet through gate "
           << i
           << " at "
           << simTime()
           << "\n";
    }
}

// =========================================
// HANDLE MESSAGE
// =========================================

void Node::handleMessage(cMessage *msg)
{
    totalPacketsReceived++;

    double creationTime =
        msg->par("creationTime").doubleValue();

    double latency =
        simTime().dbl() - creationTime;

    totalLatency += latency;

    int hops = msg->par("hopCount");

    EV << "\n";

    EV << getName()
       << " received allgather packet\n";

    EV << "Source: "
       << msg->par("source").stringValue()
       << "\n";

    EV << "Latency: "
       << latency
       << "\n";

    EV << "Hop count: "
       << hops
       << "\n";

    EV << "Receive time: "
       << simTime()
       << "\n";

    delete msg;
}

// =========================================
// FINISH
// =========================================

void Node::finish()
{
    EV << "\n=====================================\n";

    EV << "Naive Allgather Summary for "
       << getName()
       << "\n";

    EV << "Packets Sent: "
       << totalPacketsSent
       << "\n";

    EV << "Packets Received: "
       << totalPacketsReceived
       << "\n";

    if (totalPacketsReceived > 0)
    {
        EV << "Average Latency: "
           << totalLatency / totalPacketsReceived
           << "\n";
    }

    EV << "Simulation End Time: "
       << simTime()
       << "\n";

    EV << "=====================================\n";
}
