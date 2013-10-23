# Add more folders to ship with the application, here
folder_01.source = qml
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
# QML_IMPORT_PATH =


DEPLOYMENT.display_name = Ну, погоди!
VERSION = 1.0.1
symbian:ICON = egghunter1_1.svg

# Avoid auto screen rotation
DEFINES += ORIENTATIONLOCK

symbian:TARGET.UID3 = 0x20041E7C

# Allow network access on Symbian

# Define QMLJSDEBUGGER to allow debugging of QML in debug builds
# (This might significantly increase build time)
# DEFINES += QMLJSDEBUGGER

# If your application uses the Qt Mobility libraries, uncomment
# the following lines and add the respective components to the 
# MOBILITY variable. 
CONFIG += mobility11
CONFIG += mobility
MOBILITY += multimedia

supported_platforms = \
     ";Supports S60 5.0" \
     "[0x1028315F],0,0,0,{\"S60ProductID\"}" \

default_deployment.pkg_prerules += supported_platforms


 customrules.pkg_prerules = \
         "; Localised Vendor name" \
         "%{\"ICT Institute\"}" \
         " " \
         "; Unique Vendor name" \
         ":\"ICT Institute\""

DEPLOYMENT += customrules

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp
#SOURCES += devision.c

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    egghunter.svg
