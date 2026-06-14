#include <omnetpp.h>

using namespace omnetpp;

class RingNode : public cSimpleModule
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

Define_Module(RingNode);

// =========================================
// STATIC VARIABLES
// =========================================

int RingNode::totalPacketsSent = 0;
int RingNode::totalPacketsReceived = 0;
double RingNode::totalLatency = 0;


// =========================================
// INITIALIZE
// =========================================

void RingNode::initialize()
{
    int myId = atoi(getName() + 4);

    for (int dest = 0; dest < 16; dest++)
    {
        if (dest == myId)
            continue;

        cMessage *msg =
            new cMessage("ring_packet");

        msg->addPar("source") = myId;

        msg->addPar("destination") = dest;

        msg->addPar("creationTime") =
            simTime().dbl();

        msg->addPar("hopCount") = 0;

        send(msg, "out", 0);

        totalPacketsSent++;
    }
}


// =========================================
// HANDLE MESSAGE
// =========================================

void RingNode::handleMessage(cMessage *msg)
{
    int hopCount =
        (int)msg->par("hopCount");

    msg->par("hopCount") =
        hopCount + 1;

    int destination =
        (int)msg->par("destination");

    int myId =
        atoi(getName() + 4);

    // packet arrived
    if (destination == myId)
    {
        double latency =
            simTime().dbl()
            -
            msg->par("creationTime")
                .doubleValue();

        totalLatency += latency;

        totalPacketsReceived++;

        EV << "Packet reached node "
           << myId
           << "\n";

        delete msg;

        return;
    }

    // forward
    if ((int)msg->par("hopCount") < 8)
    {
        send(msg, "out", 0);

        totalPacketsSent++;
    }
    else
    {
        delete msg;
    }
}


// =========================================
// FINISH
// =========================================

void RingNode::finish()
{
    if (strcmp(getName(),"node0")==0)
    {
        EV << "\n========== FINAL RESULTS ==========\n";

        EV << "Total Packets Sent: "
           << totalPacketsSent
           << "\n";

        EV << "Total Packets Received: "
           << totalPacketsReceived
           << "\n";

        if (totalPacketsReceived > 0)
        {
            EV << "Average Latency: "
               << totalLatency /
                  totalPacketsReceived
               << "\n";
        }

        EV << "Simulation Time: "
           << simTime()
           << "\n";

        EV << "===================================\n";
    }
}
