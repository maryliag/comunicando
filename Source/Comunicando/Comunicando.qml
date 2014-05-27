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

    Component {
        id: delegate
        Item {
            id: wrapper
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
                        border.color: wrapper.PathView.isCurrentItem ? "red" : "black"
                        border.width: 10
                        radius: 10
                    }
                }
                Text {
                    text: name
                    anchors.centerIn: parent
                }
            }
        }
    }

    PathView {
        id: path
        anchors.fill: parent
        model: AcaoModel{}
        delegate: delegate
        pathItemCount: 3
        preferredHighlightBegin: 0.35
        preferredHighlightEnd: 0.65
        path: Path {
            startX: 0; startY: 200
            PathLine { x: 1000; y: 200; }
        }
        focus: true

        Timer {
             interval: 1500; running: true; repeat: true
             onTriggered: {
                 path.decrementCurrentIndex()
             }
        }

    }

}

