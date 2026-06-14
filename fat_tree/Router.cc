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
    if (!msg->hasPar("routerHop"))
    {
        msg->addPar("routerHop") = 0;
    }

    int hop =
        (int)msg->par("routerHop");

    if (hop >= 4)
    {
        delete msg;

        return;
    }

    msg->par("routerHop") =
        hop + 1;

    int outSize =
        gateSize("out");

    int gateIndex =
        intuniform(0, outSize - 1);

    EV << getName()
       << " routing packet "
       << " hop="
       << hop
       << "\n";

    send(msg, "out", gateIndex);
}
