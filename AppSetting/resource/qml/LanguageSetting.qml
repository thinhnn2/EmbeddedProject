import QtQuick 2.0
import SettingCate 1.0

Rectangle{
    property int widthScreen
    property int heightScreen
    signal closeScreen()
    id: screen_langSetting
    width: 320
    height: 240
    color: "transparent"
    Rectangle{
        id: rec_header
        width: parent.width
        height: 20
        color: "transparent"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Rectangle{
            id: rec_backArrow
            width: parent.height - 2
            height: parent.height - 2
            anchors.left: parent.left
            anchors.leftMargin: 2
            anchors.verticalCenter: parent.verticalCenter
            color: "transparent"
            Image {
                id: img_backArrow
                anchors.fill: parent
                source: "qrc:/resource/image/back.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    closeScreen()
                }
                onPressed: {
                    rec_backArrow.color = "#CCCCFF"
                }
                onReleased: {
                    rec_backArrow.color = "transparent"
                }
                onCanceled: {
                    rec_backArrow.color = "#CCCCCC"
                }
            }
        }


    }
    Rectangle{
        id: rec_langSeting
        width: parent.width
        height: parent.height - rec_header.height
        anchors.top: rec_header.bottom
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        color: "transparent"
        Text{
            id: txt_1
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: qsTr("Please choose the language:") + mytrans.emptyString
        }
        Rectangle{
            id: rec_jp
            width: 50
            height: 40
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.left: parent.left
            anchors.leftMargin: 20
            color: "transparent"
            Image{
                id: img_jp
                anchors.fill: parent
                source: "qrc:/resource/image/japan.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mytrans.updateLanguage(SettingCate.JP)
                }
                onPressed: {
                    rec_jp.color = "#CCCCFF"
                }
                onReleased: {
                    rec_jp.color = "transparent"
                }
                onCanceled: {
                    rec_jp.color = "#CCCCCC"
                }
            }
        }

        Rectangle{
            id: rec_kr
            width: 50
            height: 40
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            color: "transparent"
            Image{
                id: img_kr
                anchors.fill: parent
                source: "qrc:/resource/image/korea.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mytrans.updateLanguage(SettingCate.KR)
                }
                onPressed: {
                    rec_kr.color = "#CCCCFF"
                }
                onReleased: {
                    rec_kr.color = "transparent"
                }
                onCanceled: {
                    rec_kr.color = "#CCCCCC"
                }
            }
        }
        Rectangle{
            id: rec_vi
            width: 50
            height: 40
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.right: parent.right
            anchors.rightMargin: 20
            color: "transparent"
            Image{
                id: img_vi
                anchors.fill: parent
                source: "qrc:/resource/image/vietnam.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mytrans.updateLanguage(SettingCate.VI)
                }
                onPressed: {
                    rec_vi.color = "#CCCCFF"
                }
                onReleased: {
                    rec_vi.color = "transparent"
                }
                onCanceled: {
                    rec_vi.color = "#CCCCCC"
                }
            }
        }

        Rectangle{
            id: rec_en
            width: 50
            height: 40
            anchors.top: rec_jp.bottom
            anchors.topMargin: 10
            anchors.left: rec_jp.left
            anchors.rightMargin: 0
            color: "transparent"
            Image{
                id: img_en
                anchors.fill: parent
                source: "qrc:/resource/image/england.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mytrans.updateLanguage(SettingCate.EN)
                }
                onPressed: {
                    rec_en.color = "#CCCCFF"
                }
                onReleased: {
                    rec_en.color = "transparent"
                }
                onCanceled: {
                    rec_en.color = "#CCCCCC"
                }
            }
        }

        Rectangle{
            id: rec_cn
            width: 50
            height: 40
            anchors.top: rec_jp.bottom
            anchors.topMargin: 10
            anchors.left: rec_kr.left
            anchors.rightMargin: 0
            color: "transparent"
            Image{
                id: img_cn
                anchors.fill: parent
                source: "qrc:/resource/image/china.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mytrans.updateLanguage(SettingCate.CN)
                }
                onPressed: {
                    rec_cn.color = "#CCCCFF"
                }
                onReleased: {
                    rec_cn.color = "transparent"
                }
                onCanceled: {
                    rec_cn.color = "#CCCCCC"
                }
            }
        }


    }
}
