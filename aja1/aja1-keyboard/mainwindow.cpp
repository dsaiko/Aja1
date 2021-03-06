#include "mainwindow.h"
#include <QDebug>

#ifdef Q_OS_LINUX
#include <X11/Xlib.h>
#include <X11/XKBlib.h>

#define SCROLLLOCK 1
#define CAPSLOCK 2
#define NUMLOCK 16

void setCapslockOff() {
   Display *dpy = XOpenDisplay(0);
   XKeyboardControl values;
   values.led_mode = LedModeOff;
   values.led = 3;
   XChangeKeyboardControl(dpy, KBLedMode, &values);
   XkbLockModifiers(dpy, XkbUseCoreKbd, CAPSLOCK , 0 );
   XFlush(dpy);
   XCloseDisplay(dpy);
}

#endif

MainWindow::MainWindow()
{

}

void MainWindow::keyReleaseEvent(QKeyEvent *e)
{
    QQuickView::keyReleaseEvent(e);
#ifdef Q_OS_LINUX
    if(e->key() == Qt::Key_CapsLock) {
        setCapslockOff();
    }
#endif
}

void MainWindow::keyPressEvent(QKeyEvent *e)
{
   QQuickView::keyPressEvent(e);
}

void MainWindow::closeEvent(QCloseEvent *event)
{
    event->ignore();
}


bool MainWindow::event(QEvent *e)
{
       int type = e->type();
       if (type == QEvent::Close) {
           e->ignore();
           return true;
       }
       return QWindow::event(e);
}
