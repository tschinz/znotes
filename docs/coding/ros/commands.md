---
tags:
- coding
- ros
---
# Commandline Commands
## Commandline Variables

``` bash
echo $<variable_name>        # To display value

ROS_DISTRO                   # Distro name e.g. melodic
ROS_ETC_DIR                  #
ROS_LISP_PACKAGE_DIRECTORIES # common-lisp folder e.g. ~/catkin_ws/devel/share/common-lisp
ROS_HOSTNAME                 # ros hostname e.g. localhost
ROS_MASTER_URI               # ros master url e.g. http://localhost:11311
ROS_PACKAGE_PATH             # package path's e.g. ~/catkin_ws/src:/opt/ros/$(ROS_DISTRO)/share
ROS_PYTHON_VERSION           # python version 2 or 3 e.g. 2
ROS_ROOT                     # ros installation e.g. /opt/ros/$(ROS_DISTRO)/share/ros
ROS_VERSION                  # ros version 1 or 2 e.g. 1
```

## Useful commands
### ROS tools
#### `roscore`

Launch ROS `master` core

``` bash
roscore
```

#### `rosversion`

``` bash
rosversion -d                             # Print ROS distro name
rosversion <package_name>                 # Print package vrosnode
```

#### `rosparam`

Nodes use the parameter server to store and retrieve parameters at runtime.

[http://wiki.ros.org/rosparam](http://wiki.ros.org/rosparam>)

``` bash
rosparam list                             # list parameter names
rosparam set /<parameter_name> <value>    # set parameter
rosparam get /<parameter_name>            # get parameter
rosparam delete /<parameter_name>         # delete parameter
rosparam dump <file>                      # dump parameter to file
rosparam load                             # load parameter from file
```

#### `rosnode`

Work with `nodes`

``` bash
rosnode list                              # list all nodes
rosnode ping /<node_name>                 # check node connectivity
rosnode info /<node_node>                 # print information about node
rosnode machine                           # list nodes running on a particular machine
rosnode kill /<node_name>                 # kill a running node
```

#### `rostopic`

Work with `topics`

``` bash
rostopic list                             # list all topics
rostopic info /<topic_name>               # print information about active topic
rostopic echo /<topic_name>               # print messages to screen
rostopic pub /<topic_name> msg/MessageType "data:value" # pubish data to topic

rostopic type /<topic_name>               # print topic or field type
rostopic find <type>                      # find topics by type
rostopic bw /<topic_name>                 # display bandwidth used by topic
rostopic hz /<topic_name>                 # display publishing rate of topic
```

#### `roslaunch`

To start a launch file which can contain multiple `nodes`.

``` bash
roslaunch <ros_pkg_name> <launch_file_name> # Launch ros launch file
```

#### `rosrun`

To run a `node`

``` bash
rosrun <ros_pkg_name> <node_name>         # Start a ros node
rosrun <PACKAGE_NAME><NODE_NAME> __name:=<INSTANCE_NAME> # Start another instance of a node, the parameter *INSTANCE_NAME* can be whatever you want, but it must be unique.
```

#### `rosservice`

Work with `services`

``` bash
rosservice list                           # list active services
rosservice info <service_name>            # print information about service
rosservice uri <service_name>             # print service ROSRPC
```

#### `rosbag`

ROS offers the possibility to record the data published on topics into `bag` files :

1.create a directory to store the bag files:
  ``` bash
  ~/ mkdir ros_bag_files && cd ros_bag_files
  ```
2. run the *record* command :
  ``` bash
  rosbag record -O <bag_name>.bag <topic_name> <topic_name>
  ```
3. play the bag file :
  ``` bash
  rosbag play <bag_name>.bag
  ```

Many options are available for the *rosbag* command, see [this page](http://wiki.ros.org/rosbag/Commandline) for more details.

Note : to play a bag with point clouds, it is required to have the following topics :

- `/cloud`
- `/tf_static`

The TF transformation is required, otherwise RViz can't display the point clouds.

``` bash
rosbag record -O cloud.bag /cloud /tf_static
...
rosbag play cloud.bag
```

### `rosmsg`

Display information about ros `messages`.

``` bash
rosmsg list                     # List all messages
rosmsg info <message_name>      # Show message description
rosmsg package <package_name>   # List messages in a package
rosmsg packages <package_name>  # List packages that contain messages
```

#### Other Commands

``` bash
roscd <PKG_NAME>                 # move to the folder of the package

rosinstall <PKG_NAME>            # install a ROS package

rosdep <PKG_NAME                 # install all the dependencies of a package

rqt                              # tool with many plug-ins available such as topic publisher, service caller, …

rqt_graph                        # display the connections between nodes

rviz                             # launch the graphical tool to visualize robots, point clouds, …

view_frames                      # create a PDFcalled ``frames.pdf`` with the TF frames that are active
evince frames.pdf                # show with evince the generated frames.pdf
```

### Catkin

More info:

- [http://wiki.ros.org/catkin/Tutorials](http://wiki.ros.org/catkin/Tutorials)

#### Create Package

1. new terminal
2. navigate to the source folder of the catkin workspace : `.../catkin_ws/src`
3. run : `catkin_create_pkg <PACKAGE_NAME> <DEPENDENCIES>`
4. update both CMakeLists.txt and package.xml note : *run_depend* has to be replaced by the *exec_depend*
5. write source code in the source folder of the package :
6. build the catkin workspace with the alias command : `cm`
7. launch the master as explained [here](commands.md#roscore).
8. now launch the node as explained [here](commands.md#roslaunch) and [here](commands.md#rosrun).

``` bash
catkin_create_pkg <PKG_NAME> <PKG_DEPENDENCIES> # create a package, must be called inside a catkin workspace
```

#### Build

``` bash
cm
catkin_make                                     # build the whole workspace
catkin_make <PKG_NAME>                          # build a single package
```

#### Install

``` bash
catkin_make install                             # installs all executables
catkin_make install <PKG_NAME>                  # installs single executables
```

#### Python modules

Tips :

- put the script in a folder called *scripts*
- make sure to run `chmod +x <script_name>.py` so that the script is recognized as an executable by ROS

## Update services with RQT

1. launch *RQT* from a new terminal : run `rqt`
2. Search for the plugin *Service Caller*
3. Choose the service that you want to update
4. Fill the *expression* field with an expected parameter of this service
5. Call the service and the response is displayed
