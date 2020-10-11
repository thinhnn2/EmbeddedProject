#ifndef SETTINGCATE_H
#define SETTINGCATE_H
#include <QObject>
class SettingCate : public QObject
{
    Q_OBJECT
public:
    SettingCate(){}
    ~SettingCate(){}
    enum E_SettingCate
    {
        BLUETOOH =  0,
        INTERNET =  1,
        WIFI =      2,
        LANGUAGE =  3,
        NULL1 =     4,
        VOLUME =    5,
        TIME =      6,
        ABOUT =     7,
    };
    enum E_LANGUAGE
    {
        JP = 0,
        KR = 1,
        VI = 2,
        CN = 3,
        EN = 4,
    };

    Q_ENUM(E_SettingCate)
    Q_ENUM(E_LANGUAGE)
};
#endif // SETTINGCATE_H
