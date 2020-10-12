import QtQuick 2.0

Item {
//    Text{
//        anchors.right: mId.left
//        anchors.top: mId.Top
//        opacity: 0
//        id: plusOneText
//        text: "+1"
//        font.bold: true
//        font.pointSize: 13
//        color: "white"
//    }
//    ParallelAnimation{
//        id: plusOneTextAnim
//        NumberAnimation{
//            target: plusOneText
//            property: "opacity"
//            from: 0
//            to: 1
//            duration: 20
//        }
//        PauseAnimation{
//            duration: 250
//            onStopped: {
//                plusOneText.visible=false
//            }
//        }
//    }

    //basketball
    Image{
        visible: totalTimeTimer.running
        z:3
        id: mId
        y:0;
        x:Math.floor(Math.random() * (root2.width-width));
        width: 115
        height: 115
        source: Extra.ballSource
        NumberAnimation{
            onStopped: {
                mId.visible=false
            }
            id: fallingAnim
            target: mId
            property: "y"
            from: 0
            to: root2.height
            duration:Math.floor(Math.random() * (1200)+1800);

        }
        Component.onCompleted: {
            fallingAnim.start()
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(mId.visible&&totalTimeTimer.running){
                    mId.visible=false;
                    root2.ballClicked();
                }
            }
        }
    }
}
