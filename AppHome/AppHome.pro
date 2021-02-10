TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += src/main.cpp \
    src/ctimeapp.cpp \
    src/ctimeappcontroller.cpp \
    src/capphomeinterface.cpp


QT += dbus quick
DBUS_INTERFACES += resource/xml/setting.xml

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

TRANSLATIONS = resource/language/AppHome_en.ts \
               resource/language/AppHome_vi.ts \
               resource/language/AppHome_kr.ts \
               resource/language/AppHome_jp.ts \
               resource/language/AppHome_cn.ts

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

ICON = resource/image/home.png

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    src/constant.h \
    src/ctimeapp.h \
    src/ctimeappcontroller.h \
    src/capphometranslator.h \
    src/capphomeinterface.h
