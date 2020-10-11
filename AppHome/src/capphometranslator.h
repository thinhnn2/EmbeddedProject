#ifndef CAPPHOMETRANSLATOR_H
#define CAPPHOMETRANSLATOR_H
#include <QObject>
#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QTranslator>


class CAppHomeTranslator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)
public:
    CAppHomeTranslator(QGuiApplication* app) { mApp = app; }

    QString getEmptyString() { return ""; }

signals:
    void languageChanged();

public slots:
    void updateLanguage(int lang){
        switch(lang){
        case 0:
            if(mTranslator.load("AppHome_jp", ":/resource/language")){
                mApp->installTranslator(&mTranslator);
            }
            break;
        case 1:
            if(mTranslator.load("AppHome_kr", ":/resource/language")){
                mApp->installTranslator(&mTranslator);
            }
            break;
        case 2:
            if(mTranslator.load("AppHome_vi", ":/resource/language")){
                mApp->installTranslator(&mTranslator);
            }
            break;
        case 3:
            if(mTranslator.load("AppHome_cn", ":/resource/language")){
                mApp->installTranslator(&mTranslator);
            }
            break;
        default:
            mApp->removeTranslator(&mTranslator);
            break;
        }
        emit languageChanged();
    }

private:
    QGuiApplication* mApp;
    QTranslator mTranslator;
};

#endif // CAPPHOMETRANSLATOR_H
