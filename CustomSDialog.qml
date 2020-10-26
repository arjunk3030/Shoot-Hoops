import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.9
/*
  DESCRIPTION:

//  An example dialog implementation, with modal option and simple animations.
//  EXAMPLE USAGE:

  Scene {
    id: scene
    width: 480
    height: 320

    SimpleButton {
      text: "SHOW DIALOG"
      anchors.centerIn: parent
      onClicked: myDialog.show()
    }

    customSettingsDialog {
      id: myDialog
      box.color: "#f0f0f0"
      question.text: "Quit the game?"
      modal: true
      onSelectedOk: {
        Qt.quit()
      }
    }
  }

*/

Item { property string __felgo_live_id_component: "FELGO_COMPONENT_ID_50555"; property string __felgo_live_id_element: "FELGO_ID_50555_14193";
    z:20
    id: dialog
    anchors.fill: parent
    // we need to disable this item if it is invisible, then all the contained MouseAreas are also disabled
    enabled: visible
    // by default, the dialog is invisible
    visible: false

    // alias to access the box
    property alias box: box

    // property to make this dialog modal and prevents selecting anything behind it
    property bool modal: false

    // signals emitted if a button has been pressed
    signal selectedOk
    signal selectedCancel

    // show function
    function show() {
        // set the dialog visible to enable it and start show animation
        dialog.visible = true
        showAnimation.start()
    }

    // hide function
    function hide() {
        // start hide animation, the dialog will be set invisible once the animation has finished
        hideAnimation.start()
    }

    // this component prevents selecting anything behind the dialog, only enabled if it's a modal dialog
    MouseArea { property string __felgo_live_id_element: "FELGO_ID_50555_14194";
        anchors.fill: parent
        enabled: dialog.modal
        onClicked: {
            dialog.hide()
        }
    }

    // visible overlay, only visible if it's a modal dialog
    Rectangle { property string __felgo_live_id_element: "FELGO_ID_50555_14195";
        id: overlay
        visible: dialog.modal
        anchors.fill: parent
        color: "#000"
    }

    // the box containing dialog text and buttons
    Rectangle { property string __felgo_live_id_element: "FELGO_ID_50555_14196";
        MouseArea{ property string __felgo_live_id_element: "FELGO_ID_50555_14197";
            anchors.fill: parent
            enabled: dialog.modal
        }
        id: box
        color: "white"
        border.width: 1
        border.color: "black"
        radius: 10
        anchors.centerIn: parent
        onVisibleChanged: {
            if(visible){
                Extra.isOpen = true;
            }
            else{
                settingsDialog.visible=false
                Extra.volume=volumeSlider.volume
                Extra.sound=soundSlider.sound
                Extra.isOpen = false;
            }
        }

        //            x: Math.round((705 - width) / 2)
        //            y: 130
        //            y: Math.round(785 / 6)
        //            width: Math.round(Math.min(705, 785) /3 * 2)
        width: 620
        height: 550
        focus: true
        ColumnLayout { property string __felgo_live_id_element: "FELGO_ID_50555_14198";
            id: settingsColumn
            spacing: 80
            y:15
            Text{ property string __felgo_live_id_element: "FELGO_ID_50555_21741";
                width: 400
                text: "          Settings                      "
                font.family: "Bodoni MT Black"
                wrapMode: Label.Wrap
                font.pixelSize: 50
                font.bold:true;
                id: setttingsTitle
            }
            Rectangle{ property string __felgo_live_id_element: "FELGO_ID_50555_14200";
                color: "white"
                height: 20
                width:parent.width
                IconButtonBarItem{ property string __felgo_live_id_element: "FELGO_ID_50555_14201";
                    anchors.verticalCenter: parent.verticalCenter
                    x:10
                    visible:true
                    color: "black"
                    id: musicVolumeIcon
                    icon: (Extra.volume<0.45)?((Extra.volume<0.02)?IconType.volumeoff:IconType.volumeoff):IconType.volumeup
                    iconSize: 50
                    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_50555_14202";
                        anchors.centerIn: parent
                        width: 50
                        height:width
                        color:"transparent"
                        MouseArea{ property string __felgo_live_id_element: "FELGO_ID_50555_14203";
                            anchors.fill: parent
                            onClicked:{
                                musicVolumeIcon.icon=IconType.volumeoff
                                Extra.volume=0.0;
                                shouldExtraVolumeChange=false
                                volumeSlider.valueChanged();

                                //nobody knows why but do it twice
                                musicVolumeIcon.icon=IconType.volumeoff
                                Extra.volume=0.0;
                                shouldExtraVolumeChange=false
                                volumeSlider.valueChanged();
                            }
                        }
                    }
                }
                Label{ property string __felgo_live_id_element: "FELGO_ID_50555_14204";
                    anchors.verticalCenter: parent.verticalCenter
                    x:98
                    text: "Music:"
                    font.pointSize: 22
                    font.bold: true
                    id: musicText
                }
                AppSlider { property string __felgo_live_id_element: "FELGO_ID_50555_14205";
                    anchors.verticalCenter: parent.verticalCenter
                    Component.onCompleted:{
                        x=musicText.width+musicText.x+18
                    }
                    x:musicText.width+musicText.x+18
                    from: 0
                    to: 1
                    handle:Rectangle{ property string __felgo_live_id_element: "FELGO_ID_50555_14206";
                        x: volumeSlider.leftPadding + volumeSlider.visualPosition * (volumeSlider.availableWidth - width)
                        y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2
                        implicitWidth: volumeSlider.pressed ? 34: 28
                        implicitHeight: volumeSlider.pressed ? 34: 28
                        radius: volumeSlider.pressed ? 34: 28
                        color: volumeSlider.pressed ? "#233ab8" : "#3F51B5"
                        border.color:  volumeSlider.pressed ? "#233ab8" : "#3F51B5"
                    }
                    background: Rectangle { property string __felgo_live_id_element: "FELGO_ID_50555_14207";
                        x: volumeSlider.leftPadding
                        y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2
                        implicitWidth: 320
                        implicitHeight: 14
                        width: volumeSlider.availableWidth
                        height: implicitHeight
                        radius: 12
                        color: "#7C7C7C"
                        Rectangle { property string __felgo_live_id_element: "FELGO_ID_50555_14208";
                            width: volumeSlider.visualPosition * parent.width
                            height: parent.height
                            color: "#3F51B5"
                            radius: 12
                        }
                    }
                    id: volumeSlider
                    onValueChanged: {
                        if(value<0.02){
                            if(!(musicVolumeIcon.icon===IconType.volumeoff)){
                                musicVolumeIcon.icon=IconType.volumeoff
                            }
                        }
                        else if(value<0.45){
                            if(!(musicVolumeIcon.icon===IconType.volumedown)){
                                musicVolumeIcon.icon=IconType.volumedown
                            }
                        }
                        else {
                            if(!(musicVolumeIcon.icon===IconType.volumeup)){
                                musicVolumeIcon.icon=IconType.volumeup
                            }
                        }
                        if(shouldExtraVolumeChange){
                            Extra.volume=volumeSlider.volume
                        }
                        else
                            shouldExtraVolumeChange=true
                    }
                    value: QtMultimedia.convertVolume(Extra.volume,QtMultimedia.LinearVolumeScale,QtMultimedia.LogarithmicVolumeScale);
                    property real volume: QtMultimedia.convertVolume(volumeSlider.value,
                                                                     QtMultimedia.LogarithmicVolumeScale, QtMultimedia.LinearVolumeScale)
                }
            }

            Rectangle{ property string __felgo_live_id_element: "FELGO_ID_50555_14209";
                color: "white"
                height: 20
                width:parent.width
                IconButtonBarItem{ property string __felgo_live_id_element: "FELGO_ID_50555_14210";
                    x:10
                    anchors.verticalCenter: parent.verticalCenter;
                    visible:true
                    color: "black"
                    id: musicSoundIcon
                    icon: (Extra.sound<0.45)?((Extra.sound<0.02)?IconType.volumeoff:IconType.volumeoff):IconType.volumeup
                    iconSize: 50
                    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_50555_14211";
                        anchors.centerIn: parent
                        width: 40
                        height:width
                        color:"transparent"
                        MouseArea{ property string __felgo_live_id_element: "FELGO_ID_50555_14212";
                            anchors.fill: parent
                            onClicked:{
                                musicSoundIcon.icon=IconType.volumeoff
                                Extra.sound=0.0;
                                shouldExtraSoundChange=false
                                soundSlider.valueChanged();

                                //nobody knows why but do it twice
                                musicSoundIcon.icon=IconType.volumeoff
                                Extra.sound=0.0;
                                shouldExtraSoundChange=false
                                soundSlider.valueChanged();
                            }
                        }
                    }
                }
                Label{ property string __felgo_live_id_element: "FELGO_ID_50555_14213";
                    anchors.verticalCenter: parent.verticalCenter
                    x:98
                    text: "Sound:"
                    font.pointSize: 22
                    font.bold: true
                    id: soundText
                }
                AppSlider { property string __felgo_live_id_element: "FELGO_ID_50555_14214";
                    anchors.verticalCenter: parent.verticalCenter
                    Component.onCompleted:{
                        x=soundText.width+soundText.x+18
                    }
                    x:soundText.width+soundText.x+18
                    id: soundSlider
                    from: 0
                    to: 1
                    handle:Rectangle{ property string __felgo_live_id_element: "FELGO_ID_50555_14215";
                        x: soundSlider.leftPadding + soundSlider.visualPosition * (soundSlider.availableWidth - width)
                        y: soundSlider.topPadding + soundSlider.availableHeight / 2 - height / 2
                        implicitWidth: soundSlider.pressed ? 34: 28
                        implicitHeight: soundSlider.pressed ? 34: 28
                        radius: soundSlider.pressed ? 34: 28
                        color: soundSlider.pressed ? "#233ab8" : "#3F51B5"
                        border.color:  soundSlider.pressed ? "#233ab8" : "#3F51B5"
                    }
                    background: Rectangle { property string __felgo_live_id_element: "FELGO_ID_50555_14216";
                        x: soundSlider.leftPadding
                        y: soundSlider.topPadding + soundSlider.availableHeight / 2 - height / 2
                        implicitWidth: 320
                        implicitHeight: 14
                        width: soundSlider.availableWidth
                        height: implicitHeight
                        radius: 12
                        color: "#7C7C7C"
                        Rectangle { property string __felgo_live_id_element: "FELGO_ID_50555_14217";
                            width: soundSlider.visualPosition * parent.width
                            height: parent.height
                            color: "#3F51B5"
                            radius: 12
                        }
                    }
                    onValueChanged: {
                        if(value<0.02){
                            if(!(musicSoundIcon.icon===IconType.volumeoff)){
                                musicSoundIcon.icon=IconType.volumeoff
                            }
                        }
                        else if(value<0.45){
                            if(!(musicSoundIcon.icon===IconType.volumedown)){
                                musicSoundIcon.icon=IconType.volumedown
                            }
                        }
                        else {
                            if(!(musicSoundIcon.icon===IconType.volumeup)){
                                musicSoundIcon.icon=IconType.volumeup
                            }
                        }
                        if(shouldExtraSoundChange){
                            Extra.sound=soundSlider.sound
                        }
                        else
                            shouldExtraSoundChange=true
                    }
                    value: QtMultimedia.convertVolume(Extra.sound,QtMultimedia.LinearVolumeScale,QtMultimedia.LogarithmicVolumeScale);
                    property real sound: QtMultimedia.convertVolume(soundSlider.value,
                                                                    QtMultimedia.LogarithmicVolumeScale, QtMultimedia.LinearVolumeScale)
                }
            }
            Rectangle{ property string __felgo_live_id_element: "FELGO_ID_50555_14218";
                width: 3
                height: 38-soundSlider.implicitHeight
            }
        }
        Button { property string __felgo_live_id_element: "FELGO_ID_50555_14219";
            Rectangle{ property string __felgo_live_id_element: "FELGO_ID_50555_14220";
                anchors.fill: parent
                color: okButton.pressed?"#233ab8" : "#3F51B5"
            }
            Text{ property string __felgo_live_id_element: "FELGO_ID_50555_14221";
                anchors.centerIn: parent
                font.pointSize: 20
                text: "Ok"
                color: "White"
                font.family: "Century Gothic"
            }
            id: okButton
            width: templateButton.width+140
            height: templateButton.height+38
            anchors.right: parent.right
            anchors.rightMargin: 30
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            onClicked: {
                // emit signal and hide dialog if button is selected
                dialog.selectedOk()
                dialog.hide()
            }
        }
        Button{ property string __felgo_live_id_element: "FELGO_ID_50555_14222";
            visible: false
            id: templateButton
        }
    }

    // animation to show the dialog
    ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_50555_14223";
        id: showAnimation
        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_50555_14224";
            target: box
            property: "scale"
            from: 0
            to: 1
            easing.type: Easing.OutBack
            duration: 250
        }
        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_50555_14225";
            target: overlay
            property: "opacity"
            from: 0
            to: 0.2
            duration: 250
        }
    }

    // animation to hide the dialog
    ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_50555_14226";
        id: hideAnimation
        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_50555_14227";
            target: box
            property: "scale"
            from: 1
            to: 0
            easing.type: Easing.InBack
            duration: 250
        }
        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_50555_14228";
            target: overlay
            property: "opacity"
            from: 0.2
            to: 0
            duration: 250
        }
        onStopped: {
            // set it invisible when the animation has finished to disable MouseAreas again
            dialog.visible = false
        }
    }
}
