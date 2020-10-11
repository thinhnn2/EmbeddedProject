#ifndef CTIMEAPPCONTROLLER_H
#define CTIMEAPPCONTROLLER_H

#include <QObject>
#include "ctimeapp.h"
#include <QThread>
#include <QDebug>

class CTimeAppController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int hour READ hour WRITE setHour NOTIFY hourChanged)
    Q_PROPERTY(int minute READ minute WRITE setMinute NOTIFY minuteChanged)
    QThread workerThread;
public:
    CTimeApp *worker;
public:
    explicit CTimeAppController(QObject* parent = nullptr);
    ~CTimeAppController();
    CTimeApp *getTimeApp();
    QString getCurrentTime();
public:
    int m_hour;
    int m_minute;
    void setHour(const int &a) {
        if (a != m_hour) {
            m_hour = a;
            emit hourChanged();
        }
    }
    int hour() const {
        return m_hour;
    }
    void setMinute(const int &a) {
        if (a != m_minute) {
            m_minute = a;
            emit minuteChanged();
        }
    }
    int minute() const {
        return m_minute;
    }

public slots:
    void handleUpdateTimming();
signals:
    void operate(const QString &);
    void updateTimeUI();
    void hourChanged();
    void minuteChanged();
};

#endif // CTIMEAPPCONTROLLER_H
