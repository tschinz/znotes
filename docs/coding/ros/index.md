---
tags:
- coding
- ros
---
# ROS

![](img/logo.svg){.center width="150px"}

## Contents

- [Book Summary](books-summary.md)
- [Install](install.md)
- [Lidar Driver](lidar-driver.md)
- [Packages](packages.md)
- [External Packages](packages-ext.md)
- [Basics](basics.md)
- [Launch](launch.md)
- [Catkin Tools](catkin_tools.md)
- [RViz](rviz.md)
- [TF2](tf2.md)

## Introduction

ROS aka Robotic Operating System is not a OS itself but a framework and middleware.

- Software Framework for programming robots
- Prototype from Standfort AI Research Institute and created by Willow Garage in 2007
- Since 2013 maintained by the Open Source Robotics Foundation (OSRF)
- Consists of infrastrucutre, tools, capabilities and a ecosystem

| Advantages                                              | Disadvantages |
| --------------------------------------------------------|---------------------------------- |
| Provides lots of infrastructure, tools and capabilities | Approaching maturity, but still changing |
| Easy to try other people's work and share your own      | Security and scalability are not first-class concerns |
| Large community                                         | OSes other than Ubuntu Linux are not well supported |
| Free, open source, BSD license | |
| **Great for open-source and researchers**               | **Not great for mission-critical tasks**

ROS Tutorial #1 - [https://www.youtube.com/watch?v=9U6GDonGFHw&t=1s](https://www.youtube.com/watch?v=9U6GDonGFHw&t=1s)

![ROS Equation](img/ros-equation.png)

| Plumbing                    |  Tools                    | Capabilities  | Ecosystem |
| --------------------------- | ------------------------- | --------------| ---------------- |
| Process management          |  Simulation               | Control       | Package organization |
| Inter-process communication |  Visualization            | Planning      | Software distribution |
| Device drivers              |  Graphical user interface | Perception    | Documentation |
|                             |  Data logging             | Mapping       | Tutorials |
|                             |                           | Manipulation  | |

### Philosophy

- **Peer to peer** - Individual programs communicate over defined API (ROS messages, services, etc.).
- **Distributed** - Programs can be run on multiple computers and communicate over the network.
- **Multi-lingual** - ROS modules can be written in any language for which a client library exists (C++, Python, MATLAB, Java, etc.).
- **Thin** - The ROS conventions encourage contributors to create standalone libraries and then wrap those libraries so they can send and receive messages to and from other ROS modules.
- **Free and open source** - The core of ROS is released under the permissive BSD license, which allows commercial and noncommercial use.
