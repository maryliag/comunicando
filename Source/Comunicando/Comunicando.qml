import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    //Descrição da tela principal
    id: programa
    width: 1200
    height: 900
    state: "TELA_INICIAL"
    //Confirmação do grupo de objetos selecionadas, inicialmente colocamos apenas dois
    Rectangle {
        id: tela_mensagem
        anchors.fill: parent
        z: 0
        //Primeiro objeto selecionado e sua descrição
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
        //Segundo objeto selecionado
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
        //Botão de retorno para tela inicial
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

                    if(path.path == tela_inicial.horizontalConfirmacao) {
                        setaDireita1.visible = true
                        setaDireita2.visible = true
                        path.path = tela_inicial.horizontal
                    }
                    else {
                        setaBaixo1.visible = true
                        setaBaixo2.visible = true
                        path.path = tela_inicial.vertical
                    }
                }
            }
        }
    }

    //Construção da tela inicial
    Rectangle {
        id: tela_inicial
        anchors.fill: parent
        z: 1
        property int modo_selecao: 1
        property int tamanho_imagem: 150
        property int tamanho_imagem_selecionada: 75
        property int contador_x: 480
        property int contador_y: 170

        //Definindo as listas de elementos
        property ListModel modelo: AcaoModel{}
        property ListModel confirmacao: ConfirmacaoModel{}

        //Modo de vizualização horizontal e Vertical
        property Path horizontal: Path {
            startX: 25; startY: 200
            PathLine { x: 965; y: 200; }
        }
        property Path vertical: Path {
            startX: 425; startY: 15
            PathLine { x: 425; y: 800; }
        }
        property Path horizontalConfirmacao: Path {
            startX: 0; startY: 200
            PathLine { x: 600; y: 200; }
        }
        property Path verticalConfirmacao: Path {
            startX: 425; startY: 0
            PathLine { x: 425; y: 600; }
        }
        //Feedback para o usuário que ele selecinou uma imagem no canto superior esquerdo
        //Primeira e segunda imagens selecionadas
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

        //Texto explicando funcionamento do botão no canto superior direito
        Text {
            id: explicacaos_modo
            x: 780
            y: 100
            text: "Espere a opção desejada e\nclique na área preta"
        }

        Text {
            id: tempo_selecao
            x: tela_inicial.contador_x
            y: tela_inicial.contador_y
            scale: 2
        }

        Text {
            id: texto_modo_selecao
            x: 10
            y: 520
            font.bold: true
            text: "Modo de seleção: varredura"
        }

        Text {
            x: 10
            y: 540
            text: "*Aperte 1 para escolher o modo de seleção de varredura\nou 2 para o de contagem regressiva"
        }

        Text {
            id: texto_timer
            x: 10
            y: 600
            font.bold: true
            text: "Tempo: " + timer.interval / 1000 + "s"
        }

        Text {
            id: explicacao_tempo
            x: 10
            y: 620
            text: "*Aperte as setas para esq/dir para diminuir/aumentar\na velocidade"
        }

        Text {
            id: texto_posicionamento
            x: 10
            y: 680
            font.bold: true
            text: "Modo posicionamento das imagens: horizontal"
        }

        Text {
            x: 10
            y: 700
            text: "*Aperte V/H para escolher o modo vertical/horizontal"
        }

        Text {
            x: 10
            y: 740
            text: "*Aperte G/P para aumentar/diminuir o tamanho das\nimagens"
        }

        Image {
            id: setaDireita1
            x: 5
            y: 300
            width: 25
            height: 50
            source: "resources/setaParaDireita.png"
            PropertyAnimation on opacity  {
                easing.type: Easing.OutSine
                loops: Animation.Infinite
                from: 0
                to: 1.0
                duration: 2000
            }
        }

        Image {
            id: setaDireita2
            x: 925
            y: 300
            width: 25
            height: 50
            source: "resources/setaParaDireita.png"
            PropertyAnimation on opacity  {
                easing.type: Easing.OutSine
                loops: Animation.Infinite
                from: 0
                to: 1.0
                duration: 2000
            }
        }

        Image {
            id: setaBaixo1
            x: 525
            y: 2
            width: 50
            height: 25
            source: "resources/setaParaBaixo.png"
            visible: false
            PropertyAnimation on opacity  {
                easing.type: Easing.OutSine
                loops: Animation.Infinite
                from: 0
                to: 1.0
                duration: 2000
            }
        }

        Image {
            id: setaBaixo2
            x: 525
            y: 805
            width: 50
            height: 25
            source: "resources/setaParaBaixo.png"
            visible: false
            PropertyAnimation on opacity  {
                easing.type: Easing.OutSine
                loops: Animation.Infinite
                from: 0
                to: 1.0
                duration: 2000
            }
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
                        width: 250
                        height: 75
                        y:180
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
                                setaDireita1.visible = false
                                setaDireita2.visible = false
                                setaBaixo1.visible = false
                                setaBaixo2.visible = false
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
                                if(path.path == tela_inicial.horizontalConfirmacao) {
                                    setaDireita1.visible = true
                                    setaDireita2.visible = true
                                }
                                else {
                                    setaBaixo1.visible = true
                                    setaBaixo2.visible = true
                                }

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
                        if(path.children[i].getType() === "confirmacao") {
                            if(path.path == tela_inicial.horizontal) {
                                path.path = tela_inicial.horizontalConfirmacao
                            }
                            else if(path.path == tela_inicial.vertical){
                                path.path = tela_inicial.verticalConfirmacao
                            }
                        }
                        else {
                            if(path.path == tela_inicial.horizontalConfirmacao) {
                                path.path = tela_inicial.horizontal
                            }
                            else if(path.path == tela_inicial.verticalConfirmacao) {
                                path.path = tela_inicial.vertical
                            }
                        }
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
                x: 820
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
                                    if(path.children[i].getType() === "confirmacao") {
                                        if(path.path == tela_inicial.horizontal) {
                                            path.path = tela_inicial.horizontalConfirmacao
                                        }
                                        else if(path.path == tela_inicial.vertical){
                                            path.path = tela_inicial.verticalConfirmacao
                                        }
                                    }
                                    else {
                                        if(path.path == tela_inicial.horizontalConfirmacao) {
                                            path.path = tela_inicial.horizontal
                                        }
                                        else if(path.path == tela_inicial.verticalConfirmacao) {
                                            path.path = tela_inicial.vertical
                                        }
                                    }
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


    //Ações para os botões de ajustes do sistema para o cuidador

        Keys.onPressed: {
            //Navegação entre o modo de varedura automática e varredura com um timer para seleção
            if (event.key === Qt.Key_1) {
                tela_inicial.modo_selecao = 1
                texto_modo_selecao.text = "Modo de seleção: varredura"
                texto_timer.text = "Tempo: " + timer.interval / 1000 + "s"
                explicacao_tempo.text = "*Aperte as setas para esq/dir para diminuir/aumentar\na velocidade"
                explicacaos_modo.text = "Espere a opção desejada e\nclique na área preta"
                tempo_selecao.text = ""
                timer.start()
                timer2.stop()
            }
            else if(event.key === Qt.Key_2) {
                tela_inicial.modo_selecao = 2
                texto_modo_selecao.text = "Modo de seleção: contagem regressiva"
                texto_timer.text = "Tempo: " + timer2.interval / 1000 + "s"
                explicacao_tempo.text = "*Aperte as setas para esq/dir para diminuir/aumentar\no tempo"
                explicacaos_modo.text = "Clique na área preta até chegar\nna opção desejada e aguarde"
                tempo_selecao.text = timer2.interval/1000
                timer2.start()
                timer.stop()
            }
            //Aumentar ou diminuir o tempo de varredura
            else if(event.key === Qt.Key_Left) {
                if(tela_inicial.modo_selecao == 1) {
                    timer.interval = timer.interval - 500
                    texto_timer.text = "Tempo: " + timer.interval / 1000 + "s"
                } else {
                    timer2.interval = timer2.interval - 500
                    texto_timer.text = "Tempo: " + timer2.interval / 1000 + "s"
                    tempo_selecao.text = timer2.interval/1000
                    timer2.restart()
                }
            }

            else if(event.key === Qt.Key_Right) {
                if(tela_inicial.modo_selecao == 1) {
                    timer.interval = timer.interval + 500
                    texto_timer.text = "Tempo: " + timer.interval / 1000 + "s"
                } else {
                    timer2.interval = timer2.interval + 500
                    texto_timer.text = "Tempo: " + timer2.interval / 1000 + "s"
                    tempo_selecao.text = timer2.interval/1000
                    timer2.restart()
                }
            }
            //Aumentar ou diminuir a imagem
            else if(event.key === Qt.Key_G) {
                if(tela_inicial.tamanho_imagem < 230) {
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
            //Mudar a varredura para vertical ou horizontal
            else if(event.key === Qt.Key_V) {
                path.path = tela_inicial.vertical
                tela_inicial.contador_x = 700
                tela_inicial.contador_y = 400
                imagem2.x = 0
                imagem2.y = 160
                texto_posicionamento.text = "Modo posicionamento das imagens: vertical"
                if(menu_selecionado2.text === "") {
                    setaDireita1.visible = false
                    setaDireita2.visible = false
                    setaBaixo1.visible = true
                    setaBaixo2.visible = true
                }
            }
            else if(event.key === Qt.Key_H) {
                path.path = tela_inicial.horizontal
                path.path = tela_inicial.horizontal
                tela_inicial.contador_x = 480
                tela_inicial.contador_y = 170
                imagem2.x = 160
                imagem2.y = 0
                texto_posicionamento.text = "Modo posicionamento das imagens: horizontal"
                if(menu_selecionado2.text === "") {
                    setaDireita1.visible = true
                    setaDireita2.visible = true
                    setaBaixo1.visible = false
                    setaBaixo2.visible = false
                }
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

    //Transição entre as telas
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
