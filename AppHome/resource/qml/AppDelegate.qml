import QtQuick 2.0

Rectangle{
    property string nameApp
    property int currentIndex
    property string iconSrc
    signal chooseApp()
    id: root
    width: 320/3
    height: 320/3
    border.color: "#cabebe"
    radius: 5
    color: "transparent"
    FontLoader { id: localFont; source: "qrc:/resource/font/DINNextRoundedLTPro-Light.ttf"}
    Image {
        id: icon
        source: iconSrc
        width: 64
        height: 64
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text{
        id: txt_name
        text: nameApp
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 2
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: localFont.name
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            chooseApp();
        }
        onPressed: {
            root.color = "#CCCCFF"
        }
        onReleased: {
            root.color = "transparent"

        }
        onCanceled: {
            root.color = "transparent"
        }
    }
}
