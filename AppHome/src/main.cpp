#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "constant.h"
#include "ctimeapp.h"
#include "ctimeappcontroller.h"
#include "QDebug"
#include "QQmlContext"
#include "capphometranslator.h"
#include <QtDBus/QDBusConnection>
#include "capphomeinterface.h"
#include "setting_interface.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    CTimeAppController* timeControler = new CTimeAppController();
    timeControler->operate("Running app");

    engine.rootContext()->setContextProperty(QStringLiteral("timing"), timeControler);

    CAppHomeTranslator myTrans(&app);
    engine.rootContext()->setContextProperty("mytrans", (QObject*)&myTrans);


    engine.load(QUrl(QStringLiteral("qrc:/resource/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}
