---
tags:
- coding
- python
- qt
---
# PyQt4

## Links

- [Riverbank PyQt4 Download](http://www.riverbankcomputing.co.uk/software/pyqt/download)
- [PyQt4 Reference Guide](http://www.riverbankcomputing.co.uk/static/Docs/PyQt4/html/index.html)
- [PyQt4 Class Reference](http://www.riverbankcomputing.co.uk/static/Docs/PyQt4/html/classes.html)
- [PyQT4 CustomSerialProgramm CSP Example](https://github.com/tschinz/customSerialProgram)

## Import PyQt4 module

Python tutorial can be found at: [ZetCode Tutorial](http://zetcode.com/)

``` python title="import"
import PyQt4
from PyQt4 import QtGui, Qt
from PyQt4 import QtCore
```

## Class

Define the class to generate a Window

``` python title="class"
windowsize = (700,600)

class MainUI(QtGui.QMainWindow):

    def __init__(self, win_parent = None):
        # Init the base class
        QtGui.QMainWindow.__init__(self, win_parent)
        self.init_UI()

    def init_UI(self):
        #... code ...
        self.setWindowTitle('Python Script GUI - Main')
        #self.setWindowIcon(QtGui.QIcon('icons/zas.png'))
        self.resize(windowsize[0], windowsize[1])
        self.setCentralWidget(main_widget)
####
# Launch Window
#
if __name__ == "__main__":
    # Someone is launching this directly
    # Create the QApplication
    #app = QtGui.QApplication(sys.argv)
    app = QtGui.QApplication()
    # The Main window
    main_window = MainUI()
    main_window.show()
    # Enter the main loop
    app.exec_()
```

## Signal Slot

Especially if you have a multithreaded application all information between the threads should be exchanged with the signal slot mechanism.

Connect a signal to a function (`slot`).

``` python title="connect signal slot"
self.connect(self, QtCore.SIGNAL('signalName'),self.receiving_functionName)
```

Emit a signal with certain parameters, the parameters will be given to the function arguments.

``` python title="emit signal"
self.emit(SIGNAL("signalName"), "param_string", 10, False) # String, int and bool parameter
```

``` python title="signal slot example"
import sys
import time
from PyQt4.QtCore import *
from PyQt4.QtGui import *

class WindowEx(QWidget):
    def __init__(self, *args):
        QWidget.__init__(self, *args)
        self.connect(self, SIGNAL("signalName"), self.receiving_functionName)
        self.someFunction()

    def someFunction(self):
        self.emit(SIGNAL("signalName"), "string", 10, False)

    def receiving_functionName(self, string_param, int_param, bool_param):
        print("%s %i %b" % (string_param, int_param, bool_param))

if __name__ == "__main__":
    app = QApplication(sys.argv)
    w = MyWindow()
    w.show()
    sys.exit(app.exec_())
```

## Toolbar

``` python title="toolbar"
# Create Buttons and Shortcuts
self.run = QtGui.QAction(QtGui.QIcon('icons/run.png'), 'Run Script', self)
self.run.setShortcut('Ctrl+R')
self.connect(self.run, QtCore.SIGNAL('triggered()'), self.exe)

self.rst = QtGui.QAction(QtGui.QIcon('icons/reset.png'), 'Reset Fields', self)
self.rst.setShortcut('Ctrl+Shift+R')
self.connect(self.rst, QtCore.SIGNAL('triggered()'), self.reset)

self.info = QtGui.QAction(QtGui.QIcon('icons/info.png'), 'Info', self)
self.info.setShortcut('Ctrl+Q')
self.connect(self.info, QtCore.SIGNAL('triggered()'), self.displayInfo)

self.exit = QtGui.QAction(QtGui.QIcon('icons/exit.png'), 'Exit', self)
self.exit.setShortcut('Ctrl+Q')
self.connect(self.exit, QtCore.SIGNAL('triggered()'), QtCore.SLOT('close()'))

# Create Toolbar
self.toolbar = self.addToolBar('Actions')
self.toolbar.addAction(self.run)
self.toolbar.addAction(self.rst)
self.toolbar.addAction(self.info)
self.toolbar = self.addToolBar('Exit')
self.toolbar.addAction(self.exit)
```

## Taskbar

``` python
trayIcon = QtGui.QSystemTrayIcon(QtGui.QIcon("icons/simulate.png"), self)
trayIcon.show()
```

For Windows 7 and newer, the Taskbar uses heuristic algorithm to define groupable applications. Therefore your Python application is always grouped with the pythonw.exe application. To change that, you need to enter a specific [AppUserModelID](http://msdn.microsoft.com/en-us/library/windows/desktop/dd378422(v=vs.85).aspx).

``` python
import ctypes
myappid = 'mycompany.myproduct.subproduct.version' # arbitrary string
ctypes.windll.shell32.SetCurrentProcessExplicitAppUserModelID(myappid)
```

The Code need to be executed before and GUI is started.

## Widgets

``` python title="widgets"
# Title label
self.script_label = QtGui.QLabel("Launcher for script: " + script)

# Input widgets
self.input_label  = QtGui.QLabel("Input File:")
self.input_edit   = QtGui.QLineEdit()
self.input_button = QtGui.QPushButton("Browse")

# Output widgets
self.output_label  = QtGui.QLabel("Output Directory:")
self.output_edit   = QtGui.QLineEdit()
self.output_button = QtGui.QPushButton("Browse")

# Verbose Radiobutton
self.verbose_rb = QtGui.QRadioButton('Verbosity', self)

self.clear_button = QtGui.QPushButton("Clear")

# Textbox for output
self.textBox = QtGui.QTextEdit("Script Output")
self.textBox.setMaximumHeight(windowsize[0]-200)

# Connect signal
# Browse File button
QtCore.QObject.connect(self.input_button,
                       QtCore.SIGNAL("clicked()"),
                       self.browseFile)
# Browse Directory button
QtCore.QObject.connect(self.output_button,
                       QtCore.SIGNAL("clicked()"),
                       self.browseDir)

# Browse Directory button
QtCore.QObject.connect(self.clear_button,
                       QtCore.SIGNAL("clicked()"),
                       self.clear)

#----
# browse File
#
def browseFile(self):
    #filename = QtGui.QFileDialog.getOpenFileName(self, 'Open file', 'Path', "filters")
    filename = QtGui.QFileDialog.getOpenFileName(self, 'Open file', '', "XML files (*.xml);;All files (*)")
    self.input_edit.setText(filename)
    if not(filename == ''):
        self.statusBar().showMessage('Ready: File OK')
    else:
        self.statusBar().showMessage('Error: File NOK')
# END browseFile

#----
# browse Directory
#
def browseDir(self):
    dirname = QtGui.QFileDialog.getExistingDirectory(self, 'Open directory', '')
    self.output_edit.setText(dirname)
    if not(dirname == ''):
        self.statusBar().showMessage('Ready: Directory OK')
    else:
        self.statusBar().showMessage('Error: Directory NOK')
# END browseDir

#----
# clear terminal
#
def clear(self):
    self.textBox.setText('')
    self.statusBar().showMessage('Ready: terminal cleared')
# END clear
```

## Progressbar

The Progressbar allows to represent the % done of the program or simply to display that a process is working

``` python title="progressbar"
# Create progressbar
self.pbar = QtGui.QProgressBar(self)

# 0% of 100%
self.pbar.setValue(0)
self.pbar.setMaximum(100)
self.pbar.setMinimum(0)

# In progress, bouncing back and forth
self.pbar.setMaximum(0)
self.pbar.setMinimum(0)

# 33% of 100%
self.pbar.setValue(33)
self.pbar.setMaximum(100)
self.pbar.setMinimum(0)
```

## Layout

``` python title="layout"
# Layout
grid1 = QtGui.QGridLayout()
grid1.addWidget(self.input_label, 0, 0)
grid1.addWidget(self.input_edit, 0, 1)
grid1.addWidget(self.input_button, 0, 2)
grid1.addWidget(self.output_label, 1, 0)
grid1.addWidget(self.output_edit, 1, 1)
grid1.addWidget(self.output_button, 1, 2)
grid1.addWidget(self.verbose_rb, 2, 0)
grid1.addWidget(QtGui.QLabel(''), 2, 2)
grid1.addWidget(self.clear_button, 2, 2)

hboxCmd = QtGui.QHBoxLayout()
hboxCmd.addWidget(self.script_label)
hboxCmd.addStretch(1)

hboxTextBox = QtGui.QHBoxLayout()
hboxTextBox.addWidget(self.textBox)

main_layout = QtGui.QVBoxLayout()
main_layout.addLayout(hboxCmd)
main_layout.addLayout(grid1)
main_layout.addLayout(hboxTextBox)
main_layout.addWidget(self.pbar)

# Create central widget, add layout and set
main_widget = QtGui.QWidget()
main_widget.setLayout(main_layout)
```

## Statusbar

``` python title="statusbar"
# Write statusbar message
self.statusBar().showMessage('Ready')

# Add widget into statusbar
self.statusBar().addPermanentWidget(self.pbar,0)
```

## Center window

``` python title="center"
self.winCenter()

def winCenter(self):
    screen = QtGui.QDesktopWidget().screenGeometry()
    size =  self.geometry()
    self.move((screen.width()-size.width())/2, (screen.height()-size.height())/2)
# END win_center
```