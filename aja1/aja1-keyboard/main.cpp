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

    QGuiApplication *app = new QGuiApplication(argc, argv);

    QPixmap cursor;
    cursor.load(":/svg/arrow.png");
    app->setOverrideCursor(QCursor(cursor, 0, 0));

    MainWindow w;


    w.setResizeMode(QQuickView::SizeRootObjectToView);
    w.setSource(QUrl("qrc:///main.qml"));
    w.setWindowState(Qt::WindowFullScreen);
    w.setFlags(Qt::X11BypassWindowManagerHint | Qt::WindowStaysOnTopHint | Qt::FramelessWindowHint);
    QSize screen = QApplication::primaryScreen()->size();
    w.setWidth(screen.width()/2);
    w.setHeight(screen.height()/2);

    QQmlEngine *engine = QtQml::qmlEngine((QObject *)w.rootObject());
    QObject::connect(engine, SIGNAL(quit()), app, SLOT(quit())); // to make Qt.quit() to work.
    w.showFullScreen();

    return app->exec();

    //TODO: FLOCK, PRINTSCREEN, CTRL+ALT+DELETE
    //ALT+TAB, set CAPSLOCK OFF ALT+F4
    //TODO: MOUSE ARROW
    //TODO: ANIMATION LETTER
    //TODO: ANIMALS + ANIMATION + SOUND
    //ICON
    //NUMLOCK FN LOCK SCROLL LOCK PRINT SCREEN
}
