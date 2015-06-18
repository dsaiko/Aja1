#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QPixmap>
#include <QCursor>
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    //TODO: FLOCK, PRINTSCREEN, CTRL+ALT+DELETE
    //ALT+TAB, set CAPSLOCK OFF
    //TODO: MOUSE ARROW
    //TODO: ANIMATION LETTER
    //TODO: ANIMALS + ANIMATION + SOUND
    //ICON

    QPixmap cursor;
    cursor.load(":/svg/arrow.png");
    app.setOverrideCursor(QCursor(cursor, 0, 0));
    return app.exec();
}
