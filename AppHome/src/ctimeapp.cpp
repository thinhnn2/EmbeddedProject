#include "ctimeapp.h"
#include "ctime"
#include "chrono"
#include <qdebug.h>
#include <unistd.h>

CTimeApp::CTimeApp(QObject *parent)
    :QObject(parent)
{
    terminationRequested = false;

}

CTimeApp::~CTimeApp()
{
    mutex.unlock();
}

int CTimeApp::getHour()
{
    if(m_hour >= 0 && m_hour <= 24)
        return m_hour;
    else
        return 0;
}

int CTimeApp::getMinute()
{
    if(m_minute >= 0 && m_minute <= 60)
        return m_minute;
    else
        return 0;
}

void CTimeApp::updatTiming()
{
    QString result;
    int currentMinute = 0;
    for(;;){
        mutex.lock();
        if(terminationRequested) break;
        auto start = std::chrono::system_clock::now();
        std::time_t start_time = std::chrono::system_clock::to_time_t(start);
        tm local_tm = *localtime(&start_time);
        if(local_tm.tm_min != currentMinute) {
            currentMinute = local_tm.tm_min;
            this->m_hour = local_tm.tm_hour;
            this->m_minute = local_tm.tm_min;
            emit updateTimeComplete();
        }
        mutex.unlock();
        sleep(1);
    }
}
void CTimeApp::setTerminationFlag()
{
    QMutexLocker locker(&mutex);
    terminationRequested = true;
}
