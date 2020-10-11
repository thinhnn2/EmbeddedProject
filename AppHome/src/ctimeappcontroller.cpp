#include "ctimeappcontroller.h"


CTimeAppController::CTimeAppController(QObject *parent)
    :QObject(parent)
{
    worker = new CTimeApp();
    worker->moveToThread(&workerThread);
    connect(&workerThread, &QThread::finished, worker, &QObject::deleteLater);
    connect(this, &CTimeAppController::operate, worker, &CTimeApp::updatTiming);
    connect(worker, &CTimeApp::updateTimeComplete, this, &CTimeAppController::handleUpdateTimming);
    workerThread.start();
    m_hour = 0;
    m_minute = 0;
}

CTimeAppController::~CTimeAppController()
{
    worker->setTerminationFlag();
    workerThread.quit();
    workerThread.wait();
}

CTimeApp *CTimeAppController::getTimeApp()
{
    if(worker != 0)
        return worker;
    else
        return 0;
}

QString CTimeAppController::getCurrentTime()
{
    QString time = worker->getHour() + ":" + worker->getMinute();
    return time;
}

void CTimeAppController::handleUpdateTimming()
{
    setHour(worker->getHour());
    setMinute(worker->getMinute());
    emit updateTimeUI();
}
