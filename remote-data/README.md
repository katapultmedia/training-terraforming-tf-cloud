# Project Remote Data

Remote data is a way to use outputs from one workspace in another. This is useful for many reasons. One of the largest reasons for this is state separation.

For instance, an Ops or Security team may manage the Terraform to generate VPCs or similar. A project can then use remote data to query the state from those runs to gain specific data (vpc id, subnets, etc).

This folder doesn't really have much in it. It is largely here as a simple example.
