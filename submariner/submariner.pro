# Add more folders to ship with the application, here
folder_01.source = qml
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

DEPLOYMENT.display_name = Морской бой
VERSION = 1.0.1
symbian:TARGET.UID3 = 0x20041E7D

# Allow network access on Symbian

# Define QMLJSDEBUGGER to allow debugging of QML in debug builds
# (This might significantly increase build time)
# DEFINES += QMLJSDEBUGGER

# If your application uses the Qt Mobility libraries, uncomment
# the following lines and add the respective components to the 
# MOBILITY variable. 
CONFIG += mobility
CONFIG += mobility11
MOBILITY +=

supported_platforms = \
     ";Supports S60 5.0" \
     "[0x1028315F],0,0,0,{\"S60ProductID\"}" \

default_deployment.pkg_prerules += supported_platforms

customrules.pkg_prerules = \
        ";icthub" \
        "%{\"ICT Institute\"}" \
        " " \
        ";icthub" \
        ":\"ICT Institute\""

DEPLOYMENT += customrules

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()
