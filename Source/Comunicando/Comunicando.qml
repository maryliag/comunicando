import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    width: 1000
    height: 600

    Rectangle {
        width: 100
        height: 30
        anchors.leftMargin: 20
        anchors.topMargin: 20
        color: "blue"

        Text {
                anchors.centerIn: parent
                color: "white"
                id: menu_selecionado
            }

    }

    ListView {
        width: 920
        height: 300
        anchors.centerIn: parent
        highlightFollowsCurrentItem: true
        model: AcaoModel {}
        orientation: ListView.Horizontal
        snapMode: ListView.SnapOneItem
        spacing: 10
        focus: true
        delegate: Row {
            Button {
                id: itemButton
                width: 300
                height: 300
                action: Action {
                    onTriggered: {
                        menu_selecionado.text = name
                    }
                }

                style: ButtonStyle {
                    background: Rectangle {
                        color: cor
                        border.color: "black"
                        border.width: 5
                        radius: 10
                    }
                }

                Text {
                    text: name
                    anchors.horizontalCenter: itemButton.horizontalCenter
                    anchors.verticalCenter: itemButton.verticalCenter
                }
            }
        }
    }
}

