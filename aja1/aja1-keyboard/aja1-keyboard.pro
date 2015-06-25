TEMPLATE = app

QT += qml quick multimedia svg


unix {
    QMAKE_CXXFLAGS += -std=c++11
}

SOURCES += main.cpp \
    mainwindow.cpp

RESOURCES += qml.qrc \
    multimedia.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS +=  mainwindow.h

unix {
    LIBS += -lX11
}

RC_FILE = aja1-keyboard.rc

