---
tags:
- coding
- ros
---
# Packages
## Package Structure

ROS software is organized into packages, which can contain source code, launch files, configuration files, message definitions, data, and documentation. A package can depend on other packages called *dependencies*.

``` bash
catkin_create_pkg <package_name> {dependencies}
```

A package need two things, its source code and the message definition. It is encouraging to place message definition into a separate folder.

- :file_folder: `package_name`
  - :file_folder: `config` - parameter files (`YAML`)
  - :file_folder: `include/package_name` - C++ include headers
  - :file_folder: `launch` - `*.launch` files
  - :file_folder: `src` - Source files
  - :file_folder: `test` - Unit and or ROS Tests
  - :page_facing_up: `CMakeList.txt` - CMake build file
  - :page_facing_up: `package.xml` - Package information
- :file_folder: `package_name_msgs`
  - :file_folder: `action` - Action definitions
  - :file_folder: `msg` - Message definitions
  - :file_folder: `src` - Service definitions
  - :page_facing_up: `CMakeList.txt` - CMake build file
  - :page_facing_up: `package.xml` - Package information

More info

- [http://wiki.ros.org/Packages](http://wiki.ros.org/Packages)

## Package Files
### :page_facing_up: `package.xml`

- The `package.xml` file defines the properties of the package
  - Package name
  - Version number
  - Authors
  - Dependencies on other packages
  - ...

``` xml title="package.xml"
<?xml version="1.0"?>
<package format="2">
    <name>ros_package_template</name>
    <version>0.1.0</version>
    <description>A template for ROS packages.</description>
    <maintainer email="user@email.ch">Firstname Lastname</maintainer>
    <license>BSD</license>
    <url type="website">https://github.com/link/ros_</url>
    <author email="user@email.ch">Firstname Lastname</author>

    <buildtool_depend>catkin</buildtool_depend>

    <depend>roscpp</depend>
    <depend>sensor_msgs</depend>
</package>
```

More info

- [http://wiki.ros.org/catkin/package.xml](http://wiki.ros.org/catkin/package.xml)

### :page_facing_up: `CMakeLists.txt`

The `CMakeLists.txt` is the input to the CMake build system

1. Required CMake Version `(cmake_minimum_required)`
2. Package Name `(project())`
3. Find other CMake/Catkin packages needed for build `(find_package())`
4. Message/Service/Action Generators `(add_message_files(), add_service_files(), add_action_files())`
5. Invoke message/service/action generation `(generate_messages())`
6. Specify package build info export `(catkin_package())`
7. Libraries/Executables to build `(add_library()/add_executable()/target_link_libraries())`
8. Tests to build `(catkin_add_gtest())`
9. Install rules `(install())`

``` cmake title="CMakeLists.txt"
cmake_minimum_required(VERSION 2.8.3)
project(husky_highlevel_controller)
add_definitions(--std=c++11)

find_package(catkin REQUIRED COMPONENTS roscpp sensor_msgs )

catkin_package(
  INCLUDE_DIRS include
  # LIBRARIES
  CATKIN_DEPENDS roscpp  sensor_msgs
  # DEPENDS
)

include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(${PROJECT_NAME} src/${PROJECT_NAME}_node.cpp src/HuskyHighlevelController.cpp)

target_link_libraries(${PROJECT_NAME} ${catkin_LIBRARIES})
```

More info

- [http://wiki.ros.org/catkin/CMakeLists.txt](http://wiki.ros.org/catkin/CMakeLists.txt)

## Eclipse integration

- Build the Eclipse project files with additional build flags
  ``` bash
  catkin build package_name --cmake-args -G"Eclipse CDT4 - Unix Makefiles” -D__cplusplus=201103L D__GXX_EXPERIMENTAL_CXX0X__=1
  ```
- To use flags by default in your catkin environment, use the [catkin config]{.title-ref} command.
- The Eclipse project files will be generated in `~/catkin_ws/build`]{.title-ref}`

## C++ Client Library

- [http://wiki.ros.org/roscpp](http://wiki.ros.org/roscpp)
- [http://wiki.ros.org/roscpp/Overview](http://wiki.ros.org/roscpp/Overview)

### Example

``` cpp
#include <ros/ros.h>

int main(int argc, char** argv)                   // ROS main head file
{
    ros::init(argc, argv, "hello_world");         // has to be called before ROS func's
    ros::NodeHandle nodeHandle;                   // access poiunt for communication
    ros::Rate loopRate(10);                       // ros:Rate runs loops at desired freq e.g. 10 = 10 Hz

    unsigned int count = 0;
    while (ros::ok()) {                           // checks if a node should continue running
        ROS_INFO_STREAM("Hello World " << count); // ROS_info() logs messages from fs
        ros::spinOnce();                          // processes incommind msg via callbacks
        loopRate.sleep();
        count++;
    }
    return 0;
}
```

### Node Handle

[http://wiki.ros.org/roscpp/Overview/NodeHandles](http://wiki.ros.org/roscpp/Overview/NodeHandles)

``` cpp
// Default (public) node handle:      // Recommended
nh_ = ros::NodeHandle();              // /namespace/topic

// Private node handle:               // Recommended
nh_private_ = ros::NodeHandle("~");   // /namespace/node/topic

// Namespaced node handle:
nh_eth_ = ros::NodeHandle("hevs");    // /namespace/hevs/topic

// Global node handle:                // NOT Recommended
nh_global_ = ros::NodeHandle("/");    // /topic
```

### Logging `ROS_INFO`

- [http://wiki.ros.org/rosconsole](http://wiki.ros.org/rosconsole)
- [http://wiki.ros.org/roscpp/Overview/Logging](http://wiki.ros.org/roscpp/Overview/Logging)

Send text to log files and console. Instead of `std::cout`, use e.g. `ROS_INFO`.

#### Severity Levels

|          | Debug               | Info                | Warn                | Error               | Fatal              |
| -------- | ------------------- | ------------------- | ------------------- | ------------------- | -------------------|
| stdout   | :check_mark_button: | :check_mark_button: |                     |                     |                    |
| stderr   |                     |                     | :check_mark_button: | :check_mark_button: | :check_mark_button:|
| Log file | :check_mark_button: | :check_mark_button: | :check_mark_button: | :check_mark_button: | :check_mark_button:|
| /rosout  | :check_mark_button: | :check_mark_button: | :check_mark_button: | :check_mark_button: | :check_mark_button:|

**Formatting Style**

``` cpp
ROS_INFO("Result: %d", result);           // printf style
ROS_INFO_STREAM("Result: " << result);    // stream style
```

**Launchfile**

To see the output in the console set configuration to
[screen]{.title-ref} in the launch file.

``` xml
<launch>
    <node name="listener" more="stuff" output="screen"/>
</launch>
```

### Subscriber

[http://wiki.ros.org/roscpp/Overview/Publishers%20and%20Subscribers](http://wiki.ros.org/roscpp/Overview/Publishers%20and%20Subscribers)

Start listening to a topic by calling the method subscribe() of the node handle

``` cpp
ros::Subscriber subscriber = nodeHandle.subscribe(topic, queue_size, callback_function);
```

**Example**

``` {.cpp caption="listener.cpp"}
#include "ros/ros.h"
#include "std_msgs/String.h"

// callback function when a message is received
void chatterCallback(const std_msgs::String& msg) {
 ROS_INFO("I heard: [%s]", msg.data.c_str());
}

int main(int argc, char **argv) {
 ros::init(argc, argv, "listener");
    ros::NodeHandle nodeHandle;
    // Subscript to topic with a queue size of 10 (1-10 is recommended)
    ros::Subscriber subscriber = nodeHandle.subscribe("chatter",10,chatterCallback);
    ros::spin(); // stay's here forever
    return 0;
}
```

### Publisher

[http://wiki.ros.org/roscpp/Overview/Publishers%20and%20Subscribers](http://wiki.ros.org/roscpp/Overview/Publishers%20and%20Subscribers)

Create a publisher with help of the node handle

``` cpp
ros::Publisher publisher = nodeHandle.advertise<message_type>(topic, queue_size);
```

**Example**

``` cpp
:caption: talker.cpp
#include <ros/ros.h>
#include <std_msgs/String.h>

int main(int argc, char **argv) {
    ros::init(argc, argv, "talker");
    ros::NodeHandle nh;
    // Node handle queue size of 1
    ros::Publisher chatterPublisher = nh.advertise<std_msgs::String>("chatter", 1);
    ros::Rate loopRate(10);

    unsigned int count = 0;
    while (ros::ok()) {
        std_msgs::String message;
        // Cretae message content
        message.data = "hello world " + std::to_string(count);
        ROS_INFO_STREAM(message.data);
        chatterPublisher.publish(message);
        ros::spinOnce();
        loopRate.sleep();
        count++;
    }
    return 0;
}
```

### OOP

[http://wiki.ros.org/roscpp_tutorials/Tutorials/UsingClassMethodsAsCallbacks](http://wiki.ros.org/roscpp_tutorials/Tutorials/UsingClassMethodsAsCallbacks)

**Example**

``` cpp
:caption: my_package_node.cpp
#include <ros/ros.h>
#include "my_package/MyPackage.hpp"
int main(int argc, char** argv) {
    ros::init(argc, argv, "my_package");
    ros::NodeHandle nodeHandle("~");
    // Call
    my_package::MyPackage myPackage(nodeHandle);

    ros::spin();
    return 0;
}
```

| class MyPackage                | class Algorithm                     |
|--------------------------------|-------------------------------------|
| Main node class providing ROS interface (subscribers, parameters, timers etc.) | Class implementing the algorithmic part of the node **Note: The algorithmic part of the code could be separated in a  (ROS-independent) library** |

#### Parameter Server

[http://wiki.ros.org/roscpp/Overview/Parameter%20Server](http://wiki.ros.org/roscpp/Overview/Parameter%20Server)

**Example Parameter File**

``` yaml
:caption: config.yaml

camera:
 left:
     name: left_camera
     exposure: 1
 right:
     name: right_camera
     exposure: 1.1
```

**Example Launch file**

``` xml
<launch>
    <node name="name" pkg="package" type="node_type">
        <rosparam command="load" file="$(find package)/config/config.yaml" />
    </node>
</launch>
```

##### C++ API

``` cpp
ros::NodeHandle nodeHandle("~");
std::string topic;
if (!nodeHandle.getParam("topic", topic)) {
 ROS_ERROR("Could not find topic parameter!");
}
```

Get a parameter in C++ with

``` cpp
nodeHandle.getParam(parameter_name, variable)
```

- Method returns `true` if parameter was found, `false` otherwise
- Global and relative parameter access:
  - Global parameter name with preceding `/`
    ``` cpp
    nodeHandle.getParam("/package/camera/left/exposure", variable)
    ```
    Relative parameter name (relative to the node handle)
    ``` cpp
    nodeHandle.getParam("camera/left/exposure", variable)
    ```
- For parameters, typically use the private node handle
  ``` cpp
  ros::NodeHandle("~")
  ```