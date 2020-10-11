import QtQuick 2.6
import QtQuick.Window 2.2
import SettingCate 1.0

Window {
    id: root_screen
    visible: true
    width: 320
    height: 240
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width
    title: qsTr("Setting") + mytrans.emptyString
    signal chooseSetting(int index)
    property int mIndex: 0
    Image {
        id: img_background
        source: "qrc:/resource/image/background2.jpg"
        anchors.fill: parent
        opacity: 0.3
    }
    Rectangle{
        id: rec_setting
        width: parent.width
        height: parent.height
        anchors.top: parent.top
        anchors.topMargin: 0
        color: "transparent"
        ListView{
            id: ls_listApp
            anchors.fill: parent
            delegate: SettingDelegate{
                widthRec: widthEle
                heightRec: heightEle
                nullRec: isNull
                imgSrc: imageSource
                onClickSetting: {
                    ls_listApp.currentIndex = index
                    mIndex = index
                    chooseSetting(index)
                }
            }
            model: SettingCateModel{}
            spacing: 0
            snapMode: ListView.SnapToItem
            focus: true
        }
    }
    onChooseSetting: {
        if(mIndex === SettingCate.LANGUAGE){
            console.log("Show the screen change language!")
            loader_langSetting.sourceComponent = component_langSetting
            rec_setting.visible = false;
        }
    }

    Loader{
        id: loader_langSetting
        width: parent.width
        height: parent.heigt
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Component{
        id: component_langSetting
        LanguageSetting{
        }
    }

    Connections{
        target: loader_langSetting.item
        onCloseScreen:{
            loader_langSetting.sourceComponent = undefined;
            rec_setting.visible = true;
        }
    }
}
