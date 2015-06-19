#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QObject>
#include <QQuickView>

class MainWindow: public QQuickView
{
    Q_OBJECT

public:
    MainWindow();

protected:
    virtual void 	keyReleaseEvent(QKeyEvent * e);
    virtual void    keyPressEvent(QKeyEvent * e);
};

#endif // MAINWINDOW_H
