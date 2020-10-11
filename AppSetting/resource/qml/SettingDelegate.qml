import QtQuick 2.0
import SettingCate 1.0

Rectangle{
    property int widthRec
    property int heightRec
    property bool nullRec
    property bool switchRec
    property string imgSrc
    signal clickSetting()
    width: widthRec
    height: heightRec
    border.color: "#CCCCCC"
    color: nullRec ? "gray":"transparent"
    id: root
    Image{
        id: img_settingCate
        width: nullRec ? 0 : 32
        height: nullRec ? 0 : 32
        source: nullRec ? "" : imgSrc
        anchors.left: parent.left
        anchors.leftMargin: 3
        anchors.verticalCenter: parent.verticalCenter
    }
    Rectangle{
        id: rec_Name
        width: widthRec - img_settingCate.width
        height: heightRec
        anchors.left: img_settingCate.right
        anchors.leftMargin: 0
        color: "transparent"
        Text{
            id: txt_name
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 3
            text: qsTr(name) + mytrans.emptyString
        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            clickSetting()
        }
        onPressed: {
            if(!nullRec)
                root.color = "#CCCCFF"
        }
        onReleased: {
            if(!nullRec)
                root.color = "transparent"

        }
        onCanceled: {
            if(!nullRec)
                root.color = "transparent"
        }
    }

}
