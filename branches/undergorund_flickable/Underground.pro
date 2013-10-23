# Add more folders to ship with the application, here
folder_01.source = qml/Underground
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

#symbian:TARGET.UID3 = 0x20041E7E
symbian:TARGET.UID3 = 0xE70D7DC9

DEPLOYMENT.display_name = Карта Метро
VERSION = 1.0.1
symbian:ICON = Underground.svg

# Allow network access on Symbian
# symbian:TARGET.CAPABILITY += NetworkServices

# Define QMLJSDEBUGGER to allow debugging of QML in debug builds
# (This might significantly increase build time)
# DEFINES += QMLJSDEBUGGER

# If your application uses the Qt Mobility libraries, uncomment
# the following lines and add the respective components to the 
# MOBILITY variable. 
# CONFIG += mobility
# MOBILITY +=
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
SOURCES += main.cpp \
    xmlparser.cpp \
    model.cpp \
    appdata.cpp \
    modelchooser.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    xmlparser.h \
    model.h \
    appdata.h \
    apptypes.h \
    modelchooser.h \
    line.h



#TARGET = qmlapp
#TEMPLATE = app
#OTHER_FILES += ui.qm


QT += declarative
#QT += qt3support
QT += xml
QT += core gui declarative
CONFIG += mobility
MOBILITY += systeminfo

OTHER_FILES +=

RESOURCES += \
    qml/Underground/resourses.qrc
