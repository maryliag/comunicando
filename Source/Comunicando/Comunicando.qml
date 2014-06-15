import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.0

Rectangle {
    //Descrição da tela principal
    id: programa
    anchors.fill: parent
    state: "TELA_INICIAL"

    StatusBar {
        id: statusBar
        RowLayout {
            spacing: 10

            Label {
                text: {
                    var modoSelecao = tela_inicial.modo_selecao == 1 ? "Varredura" : "Contagem Regressiva";
                    return "Modo de seleção: " + modoSelecao;
                }
            }
            Label { text: "||" }
            Label {
                text: {
                    var timerAtual = tela_inicial.modo_selecao == 1 ? timer : timer2;
                    return "Tempo: " + timerAtual.interval / 1000 + "s"
                }
            }
        }
    }

    Component.onCompleted: {
        main_window.statusBar = statusBar;
    }

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
                }
            }
        }
    }

    //Construção da tela inicial
    Rectangle {
        focus: true
        id: tela_inicial
        anchors.fill: parent
        z: 1
        property int modo_selecao: 1
        property int tamanho_imagem: 150
        property int tamanho_imagem_selecionada: 75
        property int contador_x: 480
        property int contador_y: 170

        //Definindo as listas de elementos
        property ListModel modelo: ListModel { }
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
            y: 50
            text: "Espere a opção desejada e\nclique tela"
        }

        Text {
            id: tempo_selecao
            x: tela_inicial.contador_x
            y: tela_inicial.contador_y
            scale: 2
        }

        Text {
            id: texto_posicionamento
            x: 10
            y: 680
            font.bold: true
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
                    border.color: wrapper.GridView.isCurrentItem ? "red" : "black"
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
                    if(wrapper.GridView.isCurrentItem) {
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

        GridView {
            id: grid
            x: 200
            y: 200

            width: 800
            height: 600
            keyNavigationWraps: true
            flickableDirection: Flickable.AutoFlickDirection
            highlightFollowsCurrentItem: false
            model: tela_inicial.modelo
            cellWidth: 400
            cellHeight: 420
            delegate: delegate
            highlight: highlight
            property int posicao_grid : 1


            Component.onCompleted: {
                database.popularListModel(tela_inicial.modelo);
            }
        }

        Timer {
            id: timer
            interval: 2000; running: true; repeat: true
            onTriggered: {
                if (tela_inicial.modo_selecao == 1){
                    if(grid.posicao_grid == 1){
                        grid.moveCurrentIndexDown()
                        grid.posicao_grid = 2
                    }
                    else if(grid.posicao_grid == 2){
                        grid.moveCurrentIndexUp()
                        grid.moveCurrentIndexRight()
                        grid.posicao_grid = 3
                    }
                    else if(grid.posicao_grid == 3){
                        grid.moveCurrentIndexDown()
                        grid.posicao_grid = 4
                    }
                    else if(grid.posicao_grid == 4){
                        grid.moveCurrentIndexUp()
                        grid.moveCurrentIndexLeft()
                        grid.posicao_grid = 1
                    }
                }
            }

            Component.onCompleted: {
                database.popularListModel(tela_inicial.modelo);
            }
        }

        Timer {
            id: timer2
            interval: 5000; running: false; repeat: false
            onTriggered: {
                for(var i = 0; i < grid.children.length; ++i)
                {
                    if(grid.children[i].gridView.isCurrentItem){
                        grid.children[i].seleciona()
                        grid.model = grid.children[i].getSubItens()
                        timer2.restart()
                        tempo_selecao.text = timer2.interval/1000
                        if(grid.children[i].getType() === "confirmacao") {
                            if(grid.path == tela_inicial.horizontal) {
                                grid.path = tela_inicial.horizontalConfirmacao
                            }
                            else if(grid.path == tela_inicial.vertical){
                                grid.path = tela_inicial.verticalConfirmacao
                            }
                        }
                        else {
                            if(grid.path == tela_inicial.horizontalConfirmacao) {
                                grid.path = tela_inicial.horizontal
                            }
                            else if(grid.path == tela_inicial.verticalConfirmacao) {
                                grid.path = tela_inicial.vertical
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


        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(tela_inicial.modo_selecao === 1) {
                    timer.stop()
                    for(var i = 0; i < grid.children.length; ++i)
                    {
                        if(grid.children[i].GridView.isCurrentItem){
                            grid.children[i].seleciona()
                            grid.model = grid.children[i].getSubItens()
                            if(grid.children[i].getType() === "confirmacao") {
                                //                                grid.path = tela_inicial.horizontalConfirmacao
                                //                                if(grid.path == tela_inicial.horizontal) {
                                //                                    grid.path = tela_inicial.horizontalConfirmacao
                                //                                }
                                //                                else if(grid.path == tela_inicial.vertical){
                                //                                    grid.path = tela_inicial.verticalConfirmacao
                                //                                }
                                //                            }
                                //                            else {
                                //                                 grid.path = tela_inicial.horizontal
                                //                                if(grid.path == tela_inicial.horizontalConfirmacao) {
                                //                                    grid.path = tela_inicial.horizontal
                                //                                }
                                //                                else if(grid.path == tela_inicial.verticalConfirmacao) {
                                //                                    grid.path = tela_inicial.vertical
                                //                                }
                            }
                        }
                        timer.start()
                    }
                }
                else {
                    if(grid.posicao_grid == 1){
                        grid.moveCurrentIndexDown()
                        grid.posicao_grid = 2
                    }
                    else if(grid.posicao_grid == 2){
                        grid.moveCurrentIndexUp()
                        grid.moveCurrentIndexRight()
                        grid.posicao_grid = 3
                    }
                    else if(grid.posicao_grid == 3){
                        grid.moveCurrentIndexDown()
                        grid.posicao_grid = 4
                    }
                    else if(grid.posicao_grid == 4){
                        grid.moveCurrentIndexUp()
                        grid.moveCurrentIndexLeft()
                        grid.posicao_grid = 1
                    }
                    timer2.restart()
                    tempo_selecao.text = timer2.interval/1000
                }
            }
        }




        //Ações para os botões de ajustes do sistema para o cuidador

        Keys.onPressed: {
            //Navegação entre o modo de varedura automática e varredura com um timer para seleção
            if (event.key === Qt.Key_1) {
                tela_inicial.modo_selecao = 1
                texto_modo_selecao.text = "Modo de seleção: varredura"
                explicacao_tempo.text = "*Aperte as setas para esq/dir para diminuir/aumentar\na velocidade"
                explicacaos_modo.text = "Espere a opção desejada e\nclique na tela"
                tempo_selecao.text = ""
                timer.start()
                timer2.stop()
            }
            else if(event.key === Qt.Key_2) {
                tela_inicial.modo_selecao = 2
                texto_modo_selecao.text = "Modo de seleção: contagem regressiva"
                explicacao_tempo.text = "*Aperte as setas para esq/dir para diminuir/aumentar\no tempo"
                explicacaos_modo.text = "Clique na tela até chegar\nna opção desejada e aguarde"
                tempo_selecao.text = timer2.interval/1000
                timer2.start()
                timer.stop()
            }
            //Aumentar ou diminuir o tempo de varredura
            else if(event.key === Qt.Key_Left) {
                if(tela_inicial.modo_selecao == 1) {
                    timer.interval = timer.interval - 500
                } else {
                    timer2.interval = timer2.interval - 500
                    tempo_selecao.text = timer2.interval/1000
                    timer2.restart()
                }
            }

            else if(event.key === Qt.Key_Right) {
                if(tela_inicial.modo_selecao == 1) {
                    timer.interval = timer.interval + 500
                } else {
                    timer2.interval = timer2.interval + 500
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
            }
            else if(event.key === Qt.Key_H) {
                path.path = tela_inicial.horizontal
                path.path = tela_inicial.horizontal
                tela_inicial.contador_x = 480
                tela_inicial.contador_y = 170
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
