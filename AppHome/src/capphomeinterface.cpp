#include "capphomeinterface.h"
#include <qdebug.h>

CAppHomeInterface::CAppHomeInterface(QObject *parent)
    :QObject(parent)
{

}

void CAppHomeInterface::languageChanged()
{
    qDebug() << "Receive the signal change language!";
}
