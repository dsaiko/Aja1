#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QObject>
#include <QQuickView>
#include <QMainWindow>

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
