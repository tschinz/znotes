---
tags:
- coding
- ros
---
# Basics
## Coding Rules

The following rules apply when writing code with ROS.

| Type             | Naming Rule    | Example |
| ---------------- | -------------- | ------------------------------------------- |
| Package          | under_scored   | `first_ros_package` |
| Topic, Service   | under_scored   | `raw_image` |
| File             | under_scored   | `turtlebot3_fake.cpp` |
| Namespace        | under_scored   | `ros_awesome_package` |
| Variable         | under_scored   | `string table_name;` |
| Type             | camelCased     | `typedef int32_t PropertiesNumber;` |
| Class            | camelCased     | `class UrlTable` |
| Structure        | camelCased     | `struct UrlTableProperties` |
| Enumeration Type | camelCased     | `enum ChoiceNumber` |
| Function         | camelCased     | `addTableEntry()` |
| Method           | camelCased     | `void setNumEntries(int32_t_num_entries)` |
| Constant         | ALL_CAPITALS   | `const uint8_t DAYS_IN_A_WEEK = T;` |
| Marco            | ALL_CAPITALS   | `#define PI_ROUNDED 3.0` |
_ROS Robot Programming by TurtleBot3 Developers, section 7.1.3_
## Standard Unit in ROS

| Quantity      | Unit |
| ------------- | ---------- |
| Length        | Meter |
| Mass          | Kilogram |
| Time          | Second |
| Current       | Ampere |
| Angle         | Radian |
| Frequency     | Hertz |
| Force         | Newton |
| Power         | Watt |
| Voltage       | Volt |
| Temperature   | Celsius |
_ROS Robot Programming by TurtleBot3 Developers, section 7.1.1_

## Master

ROS `master` is a Server tracking all network addresses of all nodes. In addition to network addresses it also tracks other information like parameters. All `nodes` must know the network address of the master on startup `ROS_MASTER_URI`.

A `master` can be started with the `roscore` command or a `roslaunch` will also start a `master` if it doesn't exists already.

``` bash
roscore
```

![ROS Master Publisher Slave](img/ros-master_publisher_subscriber.svg){.center}

## Publisher and Subscribers

With help of the `master`, `publisher` and `subscriber` establish a peer-to-peer connection. All `nodes` must know the network address of the master on startup `ROS_MASTER_URI`.

![ROS Publisher Slave](img/ros-publisher_subscriber.svg){.center}

- Any node can publish a message to any topic
- Any node can subscribe to any topic
- Multiple nodes can publish to the same topic
- Multiple nodes can subscribe to the same topic
- A node can publish to multiple topics
- A node can subscribe to multiple topics

## Catkin Overview

### `src/` Folder

Location for create and clone new packages

The command `catkin_make` searches only in the `src/` folder for packages and builds them

It is a good practice to clone the ros packages into a different folder e.g. `~/git/<package_name>` and create a symlink into you catkin workspace

``` bash
ls -s ~/git/<package_name>/ ~/catkin_ws/src/
```

### `build/` Folder

`catkin_make` create buixld files and intermediate cache CMake files inside the `build/` folder.

### `devel/` Folder

`catkin_make` builds each package, if successful, the target executable le is created. Executables are stored inside the `devel/` folder. Current workspace packages can be access by the command line if the following command is used:

``` bash
# for bash
source ~/<workspace_name>/devel/setup.bash

# for zsh
source ~/<workspace_name>/devel/setup.zsh
```

It is beneficial to add this the the `~/.bashrc` or `~/.zshrc` file.

In addtion there is the `catkin_tools` program which simplifies the use.

See dedicated page: [catkin_tools](./catkin_tools.md)

### `install/` Folder

After building the executables in the `devel/` folder, this executables can be install by:

``` bash
catkin_make install
```

See also:

- <http://wiki.ros.org/catkin/workspaces#Catkin_Workspaces>

# Messages

- Serialization format for structured data
- Defined in a `.msg` file
- Compiled to C++/Python classes before using them
- more info <https://wiki.ros.org/Messages>

![](img/ros-messages-1.svg){.center}
