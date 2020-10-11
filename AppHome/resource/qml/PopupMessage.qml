import QtQuick 2.0

Rectangle{
    property int widthPop
    property int heightPop
    signal closeDialog()
    id: popup_message
    width: 320
    height: 200
    color: "#CCCCCC"
    FontLoader { id: localFont; source: "qrc:/resource/font/DINNextRoundedLTPro-Light.ttf"}
    Image{
        id: img_background
        anchors.fill: parent
        source: "qrc:/resource/image/background2.jpg"
        opacity: 0.3
    }
    Text{
        id: txt_Content
        width: 290
        height: 54
        color: "#ffffff"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 15
        text: qsTr("This application is not support yet.\n Please wait") + mytrans.emptyString
        anchors.verticalCenterOffset: 0
        style: Text.Normal
        font.family: localFont.name
        font.pointSize: 13
    }

    Rectangle{
        id: btn_Close
        width: 75
        height: 35
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        border.color: "#CCCCCC"
        opacity: 0.6
        radius: 10
        Text{
            id: txt_Close
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Close") + mytrans.emptyString
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {

            }
            onPressed: {
                btn_Close.color = "#CCCCFF"
            }
            onReleased: {
                btn_Close.color = "#CCCCCC"
                closeDialog()
            }
            onCanceled: {
                btn_Close.color = "#CCCCCC"
            }
        }
    }


}
