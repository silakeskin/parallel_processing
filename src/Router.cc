#include <omnetpp.h>

using namespace omnetpp;

class Router : public cSimpleModule
{
  protected:
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(Router);

void Router::handleMessage(cMessage *msg)
{
    int destination = (int)msg->par("destination");

    int gateIndex = 0;

    // =====================================
    // LOCAL GROUP
    // =====================================

    if (destination >= 0 && destination <= 3)
    {
        gateIndex = destination;
    }

    // =====================================
    // GROUP B
    // =====================================

    else if (destination >= 4 && destination <= 7)
    {
        if (strcmp(getName(), "routerB") == 0)
            gateIndex = destination - 4;
        else
            gateIndex = 4;
    }

    // =====================================
    // GROUP C
    // =====================================

    else if (destination >= 8 && destination <= 11)
    {
        if (strcmp(getName(), "routerC") == 0)
            gateIndex = destination - 8;
        else
            gateIndex = 5;
    }

    // =====================================
    // GROUP D
    // =====================================

    else if (destination >= 12 && destination <= 15)
    {
        if (strcmp(getName(), "routerD") == 0)
            gateIndex = destination - 12;
        else
            gateIndex = 5;
    }

    EV << getName()
       << " routing packet to destination "
       << destination
       << " through gate "
       << gateIndex
       << " at time "
       << simTime()
       << "\n";

    send(msg, "out", gateIndex);
}
