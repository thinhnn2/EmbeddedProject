#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "settingcate.h"
#include "csettingapptranslator.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<SettingCate>("SettingCate", 1, 0, "SettingCate");

    QQmlApplicationEngine engine;

    CSettingAppTranslator myTrans(&app);
    engine.rootContext()->setContextProperty("mytrans", (QObject*)&myTrans);

    engine.load(QUrl(QStringLiteral("qrc:/resource/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
