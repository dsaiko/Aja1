#include <QApplication>
#include <QQmlApplicationEngine>
#include <QPixmap>
#include <QCursor>
#include <QDebug>
#include <QList>
#include <QWindow>
#include <QMainWindow>
#include <QScreen>
#include <QQuickView>
#include <QSize>

#include "mainwindow.h"

int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);

    QPixmap cursor;
    cursor.load(":/svg/arrow.png");
    app.setOverrideCursor(QCursor(cursor, 0, 0));

    MainWindow mainWindow;
    mainWindow.setSource(QUrl("qrc:///main.qml"));
    mainWindow.setWindowState(Qt::WindowFullScreen);
    mainWindow.setFlags(Qt::FramelessWindowHint);

    mainWindow.showFullScreen();
    mainWindow.raise();

    QQmlEngine *engine = QtQml::qmlEngine((QObject *)mainWindow.rootObject());
    QObject::connect(engine, SIGNAL(quit()), &app, SLOT(quit())); // to make Qt.quit() to work.

    return app.exec();
}
