import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: tela_inicial
    width: 1000
    height: 600
    property int modo_selecao: 1
    property ListModel modelo: AcaoModel{}
    Rectangle {
        width: 100
        height: 30
        color: "blue"

        Text {
                anchors.centerIn: parent
                color: "white"
                id: menu_selecionado
            }

    }
    Rectangle {
        x: 200
        width: 100
        height: 30
        anchors.leftMargin: 20
        anchors.topMargin: 20
        color: "blue"

        Text {
                anchors.centerIn: parent
                color: "white"
                id: menu_selecionado2
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
                    if(menu_selecionado.text == "")
                        menu_selecionado.text = name
                    else {
                        if(name == "Voltar")
                            menu_selecionado.text = ""
                        else
                            menu_selecionado2.text = name
                    }
                }
            }
            function getSubItens() {
                if (type === "menu") {
                    return subItems
                } else {
                    if (name === "Voltar") {
                        return modelo
                    } else {
                        return null
                    }
                }
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
        model: modelo
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
            id: timer
            interval: 1500; running: true; repeat: true
            onTriggered: {
                path.decrementCurrentIndex()
                console.log(interval)
            }
        }
    }

    Timer {
        id: timer2
        interval: 3000; running: false; repeat: false
        onTriggered: {
            for(var i = 0; i < path.children.length; ++i)
            {
                if(path.children[i].PathView.isCurrentItem){
                    path.children[i].seleciona()
                    path.model = path.children[i].getSubItens()
                    timer2.restart()
                }
            }
        }
    }

    Rectangle {
            x: 400
            width: 100
            height: 100
            border.color: "black"
            border.width: 10
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(tela_inicial.modo_selecao === 1) {
                        timer.stop()
                        for(var i = 0; i < path.children.length; ++i)
                        {
                            if(path.children[i].PathView.isCurrentItem){
                                path.children[i].seleciona()
                                path.model = path.children[i].getSubItens()
                            }
                        }
                        timer.start()
                    }
                    else {
                        console.log(timer2.interval)
                        path.decrementCurrentIndex()
                        timer2.restart()
                    }
                }

            }
        }
    Keys.onPressed: {
        if (event.key === Qt.Key_1) {
            tela_inicial.modo_selecao = 1
            timer.start()
            timer2.stop()
        }
        else if(event.key === Qt.Key_2) {
            tela_inicial.modo_selecao = 2
            timer2.start()
            timer.stop()
        }
        else if(event.key === Qt.Key_Left) {
            if(tela_inicial.modo_selecao == 1)
                timer.interval = timer.interval - 500
            else
                timer2.interval = timer2.interval - 500
        }

        else if(event.key === Qt.Key_Right) {
            if(tela_inicial.modo_selecao == 1)
                timer.interval = timer.interval + 500
            else
                timer2.interval = timer2.interval + 500
        }
    }
}
