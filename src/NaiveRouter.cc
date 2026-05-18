#include <omnetpp.h>

using namespace omnetpp;

class NaiveRouter : public cSimpleModule
{
  protected:
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(NaiveRouter);

void NaiveRouter::handleMessage(cMessage *msg)
{
    int outGateSize = gateSize("out");

    for (int i = 0; i < outGateSize; i++)
    {
        cMessage *copy = msg->dup();

        send(copy, "out", i);
    }

    delete msg;
}
