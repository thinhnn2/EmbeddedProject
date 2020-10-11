import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: win_root
    visible: true
    width: 320
    height: 240
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width
    property string timeUI: ("00:00")
    title: qsTr("Home") + mytrans.emptyString
    FontLoader { id: localFont; source: "qrc:/resource/font/DINNextRoundedLTPro-Light.ttf"}
    Image {
        id: img_background
        source: "qrc:/resource/image/background2.jpg"
        anchors.fill: parent
        opacity: 0.3
    }
    Rectangle{
        id: rec_time
        width: 50
        height: 20
        anchors.right: parent.right
        anchors.rightMargin: 3
        anchors.top: parent.top
        anchors.topMargin: 3
        color: "transparent"
        Text{
            id: txt_time
            anchors.horizontalCenter: parent.horizontalCenter
            text: (timeUI)
            font.family: localFont.name
            color: "black"
        }
    }

    ListView{
        id: lv_listApp
        width: parent.width
        height: parent.height - 50
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        focus: true
        model: ListAppModel{}
        delegate: AppDelegate{
            nameApp: name
            iconSrc: icon
            onChooseApp:{
                // signal to c++
                lv_listApp.currentIndex = index
                // TNN-TODO
                if(index >= 0){
                    // not support yet
                    console.log("Not support")
                    loader_Popup.sourceComponent = component_Popup
                    lv_listApp.visible = false
                    rec_footer.visible = false

                }

            }
        }
        snapMode: ListView.SnapToItem
        spacing: 0
        orientation: ListView.Horizontal
    }
    Loader{
        id: loader_Popup
        width: parent.width
        height: parent.heigt - 100
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Component{
        id: component_Popup
        PopupMessage{
        }
    }
    Connections{
        target: loader_Popup.item
        onCloseDialog:{
            loader_Popup.sourceComponent = undefined;
            lv_listApp.visible = true;
            rec_footer.visible = true;
        }
    }
    Connections {
        target: timing
        onUpdateTimeUI: {
            if(timing.minute > 10)
                txt_time.text = timing.hour + ":" + timing.minute;
            else
                txt_time.text = timing.hour + ":0" + timing.minute;
        }
    }
    // Test
    Rectangle{
        id: rec_footer
        width: parent.width
        height: 20
        anchors.bottom: parent.bottom
        color: "transparent"
        anchors.left: parent.left
        anchors.leftMargin: 5
        Rectangle{
            id: rec_jp
            width: 50
            height: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            //        color: "red"
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "jp"
            }
            border.color: "gray"
            color: "transparent"

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mytrans.updateLanguage(0)
                }
            }
        }
        Rectangle{
            id: rec_kr
            width: 50
            height: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.left: rec_jp.right
            anchors.leftMargin: 3
            //        color: "red"
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "kr"
            }
            border.color: "gray"
            color: "transparent"

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mytrans.updateLanguage(1)
                }
            }
        }

        Rectangle{
            id: rec_vi
            width: 50
            height: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.left: rec_kr.right
            anchors.leftMargin: 3
            //        color: "red"
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "vi"
            }
            border.color: "gray"
            color: "transparent"

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mytrans.updateLanguage(2)
                }
            }
        }
        Rectangle{
            id: rec_cn
            width: 50
            height: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.left: rec_vi.right
            anchors.leftMargin: 3
            //        color: "red"
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "cn"
            }
            border.color: "gray"
            color: "transparent"

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mytrans.updateLanguage(3)
                }
            }
        }
        Rectangle{
            id: rec_en
            width: 50
            height: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.left: rec_cn.right
            anchors.leftMargin: 3
            //        color: "red"
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "en"
            }
            border.color: "gray"
            color: "transparent"

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mytrans.updateLanguage(4)
                }
            }
        }
    }

}
