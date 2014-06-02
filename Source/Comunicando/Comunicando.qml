import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
Rectangle {
    id: programa
    width: 1000
    height: 900
    state: "TELA_INICIAL"

    Rectangle {
        id: tela_mensagem
        anchors.fill: parent
        z: 0
        Rectangle {
            id: selecionado1
            width: 250
            height: 250
            x: 150
            y: 150
            border.color: "black"
            border.width: 10
            radius: 10
            Image {
                id: imagemSelecionada1
                width: 150
                height: 150
                anchors.centerIn: parent
            }
            Rectangle {
                anchors.bottom: parent.bottom
                width: 250
                height: 52.5
                color: "transparent"
                Text {
                    id: textoSelecionado1
                    scale: 1.5
                    anchors.centerIn: parent
                }
            }
        }
        Rectangle {
            id: selecionado2
            width: 250
            height: 250
            x: 500
            y: 150
            border.color: "black"
            border.width: 10
            radius: 10
            Image {
                id: imagemSelecionada2
                width: 150
                height: 150
                anchors.centerIn: parent
            }
            Rectangle {
                anchors.bottom: parent.bottom
                width: 250
                height: 52.5
                color: "transparent"
                Text {
                    id: textoSelecionado2
                    scale: 1.5
                    anchors.centerIn: parent
                }
            }
        }
        Button {
            id: botaoOk
            text: "Ok"
            x: 415
            y: 450
            action: Action {
                onTriggered: {
                    programa.state = "TELA_INICIAL"
                    imagem1.color = "white"
                    imagem1Opcao.source = ""
                    menu_selecionado.text = ""
                    imagem2.color = "white"
                    imagem2Opcao.source = ""
                    menu_selecionado2.text =  ""
                    path.model = tela_inicial.modelo
                    if(tela_inicial.modo_selecao == 2) {
                        timer2.restart()
                        tempo_selecao.text = timer2.interval/1000
                    }
                }
            }
        }
    }

    Rectangle {
        id: tela_inicial
        anchors.fill: parent
        z: 1
        property int modo_selecao: 1
        property int modo_rolagem: 1
        property int tamanho_imagem: 150
        property int tamanho_imagem_selecionada: 75
        property ListModel modelo: AcaoModel{}
        property ListModel confirmacao: ConfirmacaoModel{}
        property Path horizontal: Path {
            startX: 0; startY: 200
            PathLine { x: 1000; y: 200; }
        }
        property Path vertical: Path {
            startX: 350; startY: 0
            PathLine { x: 350; y: 800; }
        }

        Rectangle {
            id: imagem1
            width: 150
            height: 150
            border.color: "black"
            border.width: 5
            radius: 10
            Image {
                id: imagem1Opcao
                width: tela_inicial.tamanho_imagem_selecionada
                height: tela_inicial.tamanho_imagem_selecionada
                anchors.centerIn: parent
            }
            Rectangle {
                width: 150
                height: 37.5
                y:112.5
                color: "transparent"
                Text {
                    id: menu_selecionado
                    anchors.centerIn: parent
                }
            }
        }

        Rectangle {
            id: imagem2
            x: 160
            width: 150
            height: 150
            border.color: "black"
            border.width: 5
            radius: 10
            Image {
                id: imagem2Opcao
                width: tela_inicial.tamanho_imagem_selecionada
                height: tela_inicial.tamanho_imagem_selecionada
                anchors.centerIn: parent
            }
            Rectangle {
                width: 150
                height: 37.5
                y:112.5
                color: "transparent"
                Text {
                    id: menu_selecionado2
                    anchors.centerIn: parent
                }
            }
        }

        Text {
            id: explicacao1_modo
            x: 790
            y: 120
            text: "Espere a opção desejada e"
        }

        Text {
            id: explicacao2_modo
            x: 790
            y: 140
            text: "clique na área preta"
        }

        Text {
            id: tempo_selecao
            x: 495
            y: 170
            scale: 2
        }

        Text {
            x: 20
            y: 540
            text: "*Aperte 1 ou 2 para escolher o modo de seleção"
        }

        Text {
            id: explicacao1_tempo
            x: 20
            y: 560
            text: "*Aperte as setas para esq/dir"
        }

        Text {
            id: explicacao2_tempo
            x: 20
            y: 580
            text: "para diminuir/aumentar a velocidade"
        }

        Text {
            x: 20
            y: 600
            text: "*Aperte G/P para aumentar/diminuir"
        }

        Text {
            x: 20
            y: 620
            text: "o tamanho das imagens"
        }

        Text {
            x: 20
            y: 640
            text: "*Aperte V/H para escolher vertical/horizontal"
        }

        Component {
            id: delegate
            Item {
                id: wrapper
                Rectangle {
                    id: rectangle
                    width: 250
                    height: 250
                    color: cor
                    border.color: wrapper.PathView.isCurrentItem ? "red" : "black"
                    border.width: 10
                    radius: 10
                    Image {
                        id: imagemOpcao
                        source: image
                        width: tela_inicial.tamanho_imagem
                        height: tela_inicial.tamanho_imagem
                        anchors.centerIn: parent
                    }
                    Rectangle {
                        width: 300
                        height: 75
                        y:225
                        color: "transparent"
                        Text {
                            text: name
                            scale: 1.5
                            anchors.centerIn: parent
                        }
                    }
                }
                function seleciona() {
                    if(wrapper.PathView.isCurrentItem) {
                        if(menu_selecionado.text == "") {
                            menu_selecionado.text = name
                            imagem1.color = cor
                            imagem1Opcao.source = image
                        }
                        else if (menu_selecionado2.text == ""){
                            if(name == "Voltar") {
                                menu_selecionado.text = ""
                                imagem1.color = "white"
                                imagem1Opcao.source = ""
                            }
                            else {
                                menu_selecionado2.text = name
                                imagem2.color = cor
                                imagem2Opcao.source = image
                            }
                        }
                        else {
                            if(name == "Voltar") {
                                menu_selecionado.text = ""
                                imagem1.color = "white"
                                imagem1Opcao.source = ""
                                menu_selecionado2.text = ""
                                imagem2.color = "white"
                                imagem2Opcao.source = ""
                            }
                            else {
                                programa.state = "TELA_MENSAGEM"
                            }
                        }
                    }
                }
                function getSubItens() {
                    if (type === "menu") {
                        return subItems
                    }
                    else if (type == "submenu") {
                        if (name === "Voltar") {
                            return tela_inicial.modelo
                        } else {
                            return tela_inicial.confirmacao
                        }
                    }
                    else {
                        if (name === "Voltar") {
                            return tela_inicial.modelo
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
            model: tela_inicial.modelo
            delegate: delegate
            pathItemCount: 3
            preferredHighlightBegin: 0.35
            preferredHighlightEnd: 0.65
            path: tela_inicial.horizontal
            focus: true
            Timer {
                id: timer
                interval: 4000; running: true; repeat: true
                onTriggered: {
                    path.decrementCurrentIndex()
                }
            }
        }

        Timer {
            id: timer2
            interval: 5000; running: false; repeat: false
            onTriggered: {
                for(var i = 0; i < path.children.length; ++i)
                {
                    if(path.children[i].PathView.isCurrentItem){
                        path.children[i].seleciona()
                        path.model = path.children[i].getSubItens()
                        timer2.restart()
                        tempo_selecao.text = timer2.interval/1000
                    }
                }
            }
        }

        Timer {
            id: timer3
            interval: 1000; running: true; repeat: true
            onTriggered: {
                if (tela_inicial.modo_selecao == 1) {
                    tempo_selecao.text = ""
                } else {
                    tempo_selecao.text = parseInt(tempo_selecao.text) - 1
                }
            }
        }

        Rectangle {
                x: 880
                width: 100
                height: 100
                color: "black"
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
                                timer.start()
                            }
                        }
                        else {
                            path.decrementCurrentIndex()
                            timer2.restart()
                            tempo_selecao.text = timer2.interval/1000
                        }
                    }
                }
        }

        Keys.onPressed: {
            if (event.key === Qt.Key_1) {
                tela_inicial.modo_selecao = 1
                explicacao1_tempo.text = "*Aperte as setas para esq/dir"
                explicacao2_tempo.text = "para diminuir/aumentar a velocidade"
                explicacao1_modo.text = "Espere a opção desejada e"
                explicacao2_modo.text = "clique na área preta"
                tempo_selecao.text = ""
                timer.start()
                timer2.stop()
            }
            else if(event.key === Qt.Key_2) {
                tela_inicial.modo_selecao = 2
                explicacao1_tempo.text = "*Aperte as setas para esq/dir"
                explicacao2_tempo.text = "para diminuir/aumentar o tempo"
                explicacao1_modo.text = "Clique na área preta até chegar"
                explicacao2_modo.text = "na opção desejada e aguarde"
                tempo_selecao.text = timer2.interval/1000
                timer2.start()
                timer.stop()
            }
            else if(event.key === Qt.Key_Left) {
                if(tela_inicial.modo_selecao == 1) {
                    timer.interval = timer.interval + 500
                } else {
                    timer2.interval = timer2.interval - 500
                    tempo_selecao.text = timer2.interval/1000
                    timer2.restart()
                }
            }

            else if(event.key === Qt.Key_Right) {
                if(tela_inicial.modo_selecao == 1) {
                    timer.interval = timer.interval - 500
                } else {
                    timer2.interval = timer2.interval + 500
                    tempo_selecao.text = timer2.interval/1000
                    timer2.restart()
                }
            }
            else if(event.key === Qt.Key_G) {
                if(tela_inicial.tamanho_imagem < 280) {
                    tela_inicial.tamanho_imagem = tela_inicial.tamanho_imagem + 10
                    tela_inicial.tamanho_imagem_selecionada = tela_inicial.tamanho_imagem_selecionada + 5
                }
            }
            else if(event.key === Qt.Key_P) {
                if(tela_inicial.tamanho_imagem >= 0) {
                    tela_inicial.tamanho_imagem = tela_inicial.tamanho_imagem - 10
                    tela_inicial.tamanho_imagem_selecionada = tela_inicial.tamanho_imagem_selecionada - 5
                }
            }
            else if(event.key === Qt.Key_V) {
                path.path = tela_inicial.vertical
                imagem2.x = 0
                imagem2.y = 160
            }
            else if(event.key === Qt.Key_H) {
                path.path = tela_inicial.horizontal
                imagem2.x = 160
                imagem2.y = 0
            }
        }
    }

    states: [
         State {
             name: "TELA_INICIAL"
             PropertyChanges {
                 target: tela_mensagem
                 z: 0
             }
             PropertyChanges {
                 target: tela_inicial
                 z: 1
             }
         },
         State {
             name: "TELA_MENSAGEM"
             PropertyChanges {
                 target: tela_mensagem
                 z: 1
             }
             PropertyChanges {
                 target: selecionado1
                 color: imagem1.color
             }
             PropertyChanges {
                 target: imagemSelecionada1
                 source: imagem1Opcao.source
             }
             PropertyChanges {
                 target: textoSelecionado1
                 text:  menu_selecionado.text
             }
             PropertyChanges {
                 target: selecionado2
                 color: imagem2.color
             }
             PropertyChanges {
                 target: imagemSelecionada2
                 source: imagem2Opcao.source
             }
             PropertyChanges {
                 target: textoSelecionado2
                 text:  menu_selecionado2.text
             }
             PropertyChanges {
                 target: tela_inicial
                 z: 0
             }
         }
     ]

     transitions: [
         Transition {
             to: "TELA_INICIAL"
             PropertyAnimation { duration: 0 }
         },
         Transition {
             to: "TELA_MENSAGEM"
             PropertyAnimation { duration: 0 }
         }
     ]
}
