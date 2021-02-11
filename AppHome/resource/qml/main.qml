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
        source: "qrc:/resource/image/backgound.jpg"
//        anchors.fill: parent
        opacity: 0.3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
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
                    console.log("This application is not implement yet.\nPlease wait!!!")
                    loader_Popup.sourceComponent = component_Popup
                    lv_listApp.visible = false
//                    rec_footer.visible = false

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
//            rec_footer.visible = true;
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

}
