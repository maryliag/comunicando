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
            Rectangle {
                id: rectangle
                width: 300
                height: 300
                color: cor
                border.color: wrapper.PathView.isCurrentItem ? "red" : "black"
                border.width: 10
                radius: 10
                Text {
                    text: name
                    anchors.centerIn: parent
                }
            }
            function seleciona() {
                if(wrapper.PathView.isCurrentItem) {
                    menu_selecionado.text = name
                }
            }
            function getSubItens() {
                return subItems
            }
            function getType() {
                return type
            }
            function getName() {
                return name
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
    }

    Timer {
        id: timer
        interval: 3000; running: true; repeat: false
        onTriggered: {
            for(var i = 0; i < path.children.length; ++i)
            {
                if(path.children[i].PathView.isCurrentItem){
                    path.children[i].seleciona()

                    if (path.children[i].getType() === "menu") {
                        path.model = path.children[i].getSubItens()
                    } else {
                        if (path.children[i].getName() === "Voltar") {
//                            path.model =
                        } else {

                        }

                    }

                    timer.restart()
                }
            }
        }
    }

    Rectangle {
        x: 200
        width: 100
        height: 100
        border.color: "black"
        border.width: 10
        MouseArea {
            anchors.fill: parent
            onClicked: {
                path.decrementCurrentIndex()
                timer.restart()
            }

        }
    }
}
