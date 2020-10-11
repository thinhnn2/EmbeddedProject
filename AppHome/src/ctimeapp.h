#ifndef CTIMEAPP_H
#define CTIMEAPP_H
#include <QObject>
#include <QMutex>


class CTimeApp : public QObject
{
    Q_OBJECT
public:
    explicit CTimeApp(QObject* parent = 0);
    ~CTimeApp();
    int getHour();
    int getMinute();
signals:
    void updateTime();
private:
    int m_hour;
    int m_minute;
public slots:
    void updatTiming();
    void setTerminationFlag();

signals:
    void updateTimeComplete();
private:
    QMutex mutex;
    bool terminationRequested;
};

#endif // CTIMEAPP_H
