#ifndef CAPPHOMEINTERFACE_H
#define CAPPHOMEINTERFACE_H

#include <QObject>

class CAppHomeInterface : public QObject
{
    Q_OBJECT
public:
    explicit CAppHomeInterface(QObject* parent = 0);

public slots:
    void languageChanged();
};

#endif // CAPPHOMEINTERFACE_H
