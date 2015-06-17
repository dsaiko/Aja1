#include <QGuiApplication>
#include <QQmlApplicationEngine>

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
    return app.exec();
}
