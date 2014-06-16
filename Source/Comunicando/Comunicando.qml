import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.0

Rectangle {
    //Descrição da tela principal
    id: programa
    anchors.fill: parent

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

    //Construção da tela inicial
    Rectangle {
        focus: true
        id: tela_inicial
        anchors.fill: parent
        state: "EDIT"
        property int modo_selecao: 1
        property int tamanho_imagem: 150
        property int tamanho_imagem_selecionada: 75
        property int contador_x: 480
        property int contador_y: 170
        property int numero_itens_varridos: 0

        //Definindo as listas de elementos
        property ListModel modelo: ListModel { }
        property ListModel acaoModel: AcaoModel {}
        property ListModel acaoModelBackup: AcaoModel{}
        property ListModel confirmacao: ConfirmacaoModel{}
        property ListModel selecionados: ListModel {}
        property ListModel caminhoSeguido: ListModel {}

        Rectangle {
            id: edit
            width: parent.width
            height: parent.height * 0.3
            border.color: "black"
            border.width: 10
            PathView {
                id: path
                model: tela_inicial.selecionados
                pathItemCount: 3
                path: Path {
                    startX: edit.height * 0.5; startY: edit.y + edit.height / 2
                    PathLine { x: edit.width * 1.1; y: edit.y + edit.height / 2 }
                }
                delegate: Component {
                    Rectangle {
                        id: quadrado_selecionado
                        width: edit.height * 0.8
                        height: edit.height * 0.8
                        color: cor
                        border.color: "black"
                        border.width: 5
                        Image {
                            id: selecionado_imagem
                            width: quadrado_selecionado.width * 0.6
                            height: quadrado_selecionado.height * 0.6
                            anchors.centerIn: parent
                            source: image
                        }
                        Text{
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: selecionado_imagem.bottom
                            text: name
                            font.bold: true
                            scale: 2
                        }
                    }
                }
            }
        }
        Rectangle {
            id: quadrado_1
            width: parent.width / 2
            height: parent.height * 0.3
            anchors.top: edit.bottom
            property string nome: tela_inicial.acaoModel.get(0).name
            property string cor: tela_inicial.acaoModel.get(0).cor
            property string imagem: tela_inicial.acaoModel.get(0).image
            Rectangle {
                id: item_1
                z: 1
                anchors.fill: parent
                border.color: "black"
                border.width: 10
                color: quadrado_1.cor
                Image {
                    width: item_1.width * 0.6
                    height: item_1.height * 0.6
                    anchors.centerIn: parent
                    source: quadrado_1.imagem
                }
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: parent.y + parent.height * 0.85
                    text: quadrado_1.nome
                    font.bold: true
                    scale: 2
                }
            }
            property ListModel subItens: tela_inicial.acaoModel.get(0).subItems
            Rectangle {
                id: subitem_1
                z: 0
                anchors.fill: parent
                border.color: "red"
                border.width: 10
                color: quadrado_1.cor
                GridView {
                    id: grid_1
                    anchors.fill: parent
                    cellWidth: parent.width / 2
                    cellHeight: parent.height / 2
                    model: quadrado_1.subItens
                    delegate: Component {
                        Rectangle {
                            width: grid_1.cellWidth
                            height: grid_1.cellHeight
                            border.color: "red"
                            border.width: 5
                            color: cor
                            Image {
                                id: mini_imagem
                                width: parent.width * 0.6
                                height: parent.height * 0.6
                                anchors.centerIn: parent
                                source: image
                            }
                            Text{
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: mini_imagem.bottom
                                text: name
                                font.bold: true
                                scale: 1.5
                            }
                        }
                    }
                }
            }
        }
        Rectangle {
            id: quadrado_2
            width: parent.width / 2
            height: parent.height * 0.3
            anchors.top: edit.bottom
            anchors.left: quadrado_1.right
            property string nome: tela_inicial.acaoModel.get(1).name
            property string cor: tela_inicial.acaoModel.get(1).cor
            property string imagem: tela_inicial.acaoModel.get(1).image
            Rectangle {
                id: item_2
                z:1
                anchors.fill: parent
                border.color: "black"
                border.width: 10
                color: quadrado_2.cor
                Image {
                    width: item_2.width * 0.6
                    height: item_2.height * 0.6
                    anchors.centerIn: parent
                    source: quadrado_2.imagem
                }
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: parent.y + parent.height * 0.85
                    text: quadrado_2.nome
                    font.bold: true
                    scale: 2
                }
            }
            property ListModel subItens: tela_inicial.acaoModel.get(1).subItems
            Rectangle {
                id: subitem_2
                z: 0
                anchors.fill: parent
                border.color: "red"
                border.width: 10
                color: quadrado_2.cor
                GridView {
                    id: grid_2
                    anchors.fill: parent
                    cellWidth: parent.width / 2
                    cellHeight: parent.height / 2
                    model: quadrado_2.subItens
                    delegate: Component {
                        Rectangle {
                            width: grid_2.cellWidth
                            height: grid_2.cellHeight
                            border.color: "red"
                            border.width: 5
                            color: cor
                            Image {
                                id: mini_imagem
                                width: parent.width * 0.6
                                height: parent.height * 0.6
                                anchors.centerIn: parent
                                source: image
                            }
                            Text{
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: mini_imagem.bottom
                                text: name
                                font.bold: true
                                scale: 1.5
                            }
                        }
                    }
                }
            }
        }
        Rectangle {
            id: quadrado_3
            width: parent.width / 2
            height: parent.height * 0.3
            anchors.top: quadrado_1.bottom
            property string nome: tela_inicial.acaoModel.get(2).name
            property string cor: tela_inicial.acaoModel.get(2).cor
            property string imagem: tela_inicial.acaoModel.get(2).image
            Rectangle {
                id: item_3
                z: 1
                anchors.fill: parent
                border.color: "black"
                border.width: 10
                color: quadrado_3.cor
                Image {
                    width: item_3.width * 0.6
                    height: item_3.height * 0.6
                    anchors.centerIn: parent
                    source: quadrado_3.imagem
                }
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: parent.y + parent.height * 0.85
                    text: quadrado_3.nome
                    font.bold: true
                    scale: 2
                }
            }
            property ListModel subItens: tela_inicial.acaoModel.get(2).subItems
            Rectangle {
                id: subitem_3
                z: 0
                anchors.fill: parent
                border.color: "red"
                border.width: 10
                color: quadrado_3.cor
                GridView {
                    id: grid_3
                    anchors.fill: parent
                    cellWidth: parent.width / 2
                    cellHeight: parent.height / 2
                    model: quadrado_3.subItens
                    delegate: Component {
                        Rectangle {
                            width: grid_3.cellWidth
                            height: grid_3.cellHeight
                            border.color: "red"
                            border.width: 5
                            color: cor
                            Image {
                                id: mini_imagem
                                width: parent.width * 0.6
                                height: parent.height * 0.6
                                anchors.centerIn: parent
                                source: image
                            }
                            Text{
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: mini_imagem.bottom
                                text: name
                                font.bold: true
                                scale: 1.5
                            }
                        }
                    }
                }
            }
        }
        Rectangle {
            id: quadrado_4
            width: parent.width / 2
            height: parent.height * 0.3
            anchors.top: quadrado_2.bottom
            anchors.left: quadrado_3.right
            property string nome: tela_inicial.acaoModel.get(3).name
            property string cor: tela_inicial.acaoModel.get(3).cor
            property string imagem: tela_inicial.acaoModel.get(3).image
            Rectangle {
                z: 1
                id: item_4
                anchors.fill: parent
                border.color: "black"
                border.width: 10
                color: quadrado_4.cor
                Image {
                    width: item_4.width * 0.6
                    height: item_4.height * 0.6
                    anchors.centerIn: parent
                    source: quadrado_4.imagem
                }
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: parent.y + parent.height * 0.85
                    text: quadrado_4.nome
                    font.bold: true
                    scale: 2
                }
            }
            property ListModel subItens: tela_inicial.acaoModel.get(3).subItems
            Rectangle {
                id: subitem_4
                z: 0
                anchors.fill: parent
                border.color: "red"
                border.width: 10
                color: quadrado_4.cor
                GridView {
                    id: grid_4
                    anchors.fill: parent
                    cellWidth: parent.width / 2
                    cellHeight: parent.height / 2
                    model: quadrado_4.subItens
                    delegate: Component {
                        Rectangle {
                            width: grid_4.cellWidth
                            height: grid_4.cellHeight
                            border.color: "red"
                            border.width: 5
                            color: cor
                            Image {
                                id: mini_imagem
                                width: parent.width * 0.6
                                height: parent.height * 0.6
                                anchors.centerIn: parent
                                source: image
                            }
                            Text{
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: mini_imagem.bottom
                                text: name
                                font.bold: true
                                scale: 1.5
                            }
                        }
                    }
                }
            }
        }
        Rectangle {
            id: caminho_arvore
            width: parent.width
            height: parent.height * 0.1
            anchors.top: quadrado_3.bottom
            border.color: "black"
            border.width: 10
            PathView {
                id: path_arvore
                model: tela_inicial.caminhoSeguido
                pathItemCount: 3
                path: Path {
                    startX: caminho_arvore.width * 0.2; startY: caminho_arvore.height / 2
                    PathLine { x: caminho_arvore.width * 1.1; y: caminho_arvore.height / 2 }
                }
                delegate: Component {
                    Rectangle {
                        id: quadrado_arvore
                        width: caminho_arvore.width / 3.5
                        height: caminho_arvore.height * 0.8
                        color: cor
                        border.color: "black"
                        border.width: 5
                        Text{
                            anchors.centerIn: parent
                            text: name
                            font.bold: true
                            scale: 2
                        }
                    }
                }
            }
        }

        Timer {
            id: timer
            interval: 2000; running: true; repeat: true
            onTriggered: {
                if (tela_inicial.modo_selecao == 1){
                    timer.stop()
                    tela_inicial.varredura()
                    timer.restart()
                }
            }
        }

        Timer{
            id: timer2
            interval: 2000; running: true; repeat: true
            onTriggered: {
                if (tela_inicial.modo_selecao == 2){
                    timer2.stop()
                    tela_inicial.seleciona()
                    timer2.restart()
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(tela_inicial.modo_selecao === 1) {
                    timer.stop()
                    tela_inicial.seleciona()
                    timer.start()
                }
                else {
                    timer2.stop()
                    tela_inicial.varredura()
                    timer2.restart()
                }
            }
        }

        function varredura() {
            if(tela_inicial.state === "EDIT") {
                tela_inicial.state = "QUADRADO_1"
                if(quadrado_1.subItens.count > 0) {
                    item_1.z = 0
                    subitem_1.z = 1
                }
            }
            else if(tela_inicial.state === "QUADRADO_1") {
                tela_inicial.state = "QUADRADO_2"
                item_1.z = 1
                subitem_1.z = 0
                if(quadrado_2.subItens.count > 0) {
                    item_2.z = 0
                    subitem_2.z = 1
                }
            }
            else if(tela_inicial.state === "QUADRADO_2") {
                tela_inicial.state = "QUADRADO_3"
                item_2.z = 1
                subitem_2.z = 0
                if(quadrado_3.subItens.count > 0) {
                    item_3.z = 0
                    subitem_3.z = 1
                }
            }
            else if(tela_inicial.state === "QUADRADO_3") {
                tela_inicial.state = "QUADRADO_4"
                item_3.z = 1
                subitem_3.z = 0
                if(quadrado_4.subItens.count > 0) {
                    item_4.z = 0
                    subitem_4.z = 1
                }
            }
            else if(tela_inicial.state === "QUADRADO_4") {
                tela_inicial.state = "EDIT"
                item_4.z = 1
                subitem_4.z = 0
            }
            tela_inicial.numero_itens_varridos = tela_inicial.numero_itens_varridos + 1
            if(tela_inicial.numero_itens_varridos === 10) {
                tela_inicial.numero_itens_varridos = 0
                tela_inicial.acaoModel = tela_inicial.caminhoSeguido.get(tela_inicial.caminhoSeguido.count - 1).itens
                tela_inicial.caminhoSeguido.remove(tela_inicial.caminhoSeguido.count - 1)
                if(tela_inicial.state === "QUADRADO_1") {
                    item_1.z = 0
                    subitem_1.z = 1
                }
                else if(tela_inicial.state === "QUADRADO_2") {
                    item_2.z = 0
                    subitem_2.z = 1
                }
                else if(tela_inicial.state === "QUADRADO_3") {
                    item_3.z = 0
                    subitem_3.z = 1
                }
                else if(tela_inicial.state === "QUADRADO_4") {
                    item_4.z = 0
                    subitem_4.z = 1
                }
            }
        }

        function seleciona() {
            tela_inicial.numero_itens_varridos = 0
            if(tela_inicial.state === "QUADRADO_1") {
                if(quadrado_1.subItens.count > 0) {
                    tela_inicial.caminhoSeguido.insert(tela_inicial.caminhoSeguido.count, {
                                                         name: tela_inicial.acaoModel.get(0).name,
                                                         cor: tela_inicial.acaoModel.get(0).cor,
                                                         itens: tela_inicial.acaoModel})
                    if(tela_inicial.caminhoSeguido.count > 3) {
                        path_arvore.incrementCurrentIndex()
                    }
                    tela_inicial.acaoModel = quadrado_1.subItens
                    if(quadrado_1.subItens.count == 0) {
                        item_1.z = 1
                        subitem_1.z = 0
                    }
                }
                else {
                    tela_inicial.selecionados.insert(tela_inicial.selecionados.count, {
                                                         name: tela_inicial.acaoModel.get(0).name,
                                                         cor: tela_inicial.acaoModel.get(0).cor,
                                                         image: tela_inicial.acaoModel.get(0).image
                                                     })
                    if(tela_inicial.selecionados.count > 3) {
                        path.incrementCurrentIndex()
                    }
                    tela_inicial.acaoModel = tela_inicial.acaoModelBackup
                    zeraCaminhoSeguido()
                }
            }
            else if(tela_inicial.state === "QUADRADO_2") {
                if(quadrado_2.subItens.count > 0) {
                    tela_inicial.caminhoSeguido.insert(tela_inicial.caminhoSeguido.count, {
                                                         name: tela_inicial.acaoModel.get(1).name,
                                                         cor: tela_inicial.acaoModel.get(1).cor,
                                                         itens: tela_inicial.acaoModel})
                    if(tela_inicial.caminhoSeguido.count > 3) {
                        path_arvore.incrementCurrentIndex()
                    }
                    tela_inicial.acaoModel = quadrado_2.subItens
                    if(quadrado_2.subItens.count == 0) {
                        item_2.z = 1
                        subitem_2.z = 0
                    }
                }
                else {
                    tela_inicial.selecionados.insert(tela_inicial.selecionados.count, {
                                                         name: tela_inicial.acaoModel.get(1).name,
                                                         cor: tela_inicial.acaoModel.get(1).cor,
                                                         image: tela_inicial.acaoModel.get(1).image
                                                     })
                    if(tela_inicial.selecionados.count > 3) {
                        path.incrementCurrentIndex()
                    }
                    tela_inicial.acaoModel = tela_inicial.acaoModelBackup
                    zeraCaminhoSeguido()
                }
            }
            else if(tela_inicial.state === "QUADRADO_3") {
                if(quadrado_3.subItens.count > 0) {
                    tela_inicial.caminhoSeguido.insert(tela_inicial.caminhoSeguido.count, {
                                                         name: tela_inicial.acaoModel.get(2).name,
                                                         cor: tela_inicial.acaoModel.get(2).cor,
                                                         itens: tela_inicial.acaoModel})
                    if(tela_inicial.caminhoSeguido.count > 3) {
                        path_arvore.incrementCurrentIndex()
                    }
                    tela_inicial.acaoModel = quadrado_3.subItens
                    if(quadrado_3.subItens.count == 0) {
                        item_3.z = 1
                        subitem_3.z = 0
                    }
                }
                else {
                    tela_inicial.selecionados.insert(tela_inicial.selecionados.count, {
                                                         name: tela_inicial.acaoModel.get(2).name,
                                                         cor: tela_inicial.acaoModel.get(2).cor,
                                                         image: tela_inicial.acaoModel.get(2).image
                                                     })
                    if(tela_inicial.selecionados.count > 3) {
                        path.incrementCurrentIndex()
                    }
                    tela_inicial.acaoModel = tela_inicial.acaoModelBackup
                    zeraCaminhoSeguido()
                }
            }
            else if(tela_inicial.state === "QUADRADO_4") {
                if(quadrado_4.subItens.count > 0) {
                    tela_inicial.caminhoSeguido.insert(tela_inicial.caminhoSeguido.count, {
                                                         name: tela_inicial.acaoModel.get(3).name,
                                                         cor: tela_inicial.acaoModel.get(3).cor,
                                                         itens: tela_inicial.acaoModel})
                    if(tela_inicial.caminhoSeguido.count > 3) {
                        path_arvore.incrementCurrentIndex()
                    }
                    tela_inicial.acaoModel = quadrado_4.subItens
                    if(quadrado_4.subItens.count == 0) {
                        item_4.z = 1
                        subitem_4.z = 0
                    }
                }
                else {
                    tela_inicial.selecionados.insert(tela_inicial.selecionados.count, {
                                                         name: tela_inicial.acaoModel.get(3).name,
                                                         cor: tela_inicial.acaoModel.get(3).cor,
                                                         image: tela_inicial.acaoModel.get(3).image
                                                     })
                    if(tela_inicial.selecionados.count > 3) {
                        path.incrementCurrentIndex()
                    }
                    tela_inicial.acaoModel = tela_inicial.acaoModelBackup
                    zeraCaminhoSeguido()
                }
            }
        }

        function zeraCaminhoSeguido() {
            while(tela_inicial.caminhoSeguido.count > 0) {
                tela_inicial.caminhoSeguido.remove(0)
            }
        }


        states: [
            State {
                name: "EDIT"
                PropertyChanges {
                    target: edit
                    border.color: "red"
                }
                PropertyChanges {
                    target: item_1
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_2
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_3
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_4
                    border.color: "black"
                }
            },
            State {
                name: "QUADRADO_1"
                PropertyChanges {
                    target: edit
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_1
                    border.color: "red"
                }
                PropertyChanges {
                    target: item_2
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_3
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_4
                    border.color: "black"
                }
            },
            State {
                name: "QUADRADO_2"
                PropertyChanges {
                    target: edit
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_1
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_2
                    border.color: "red"
                }
                PropertyChanges {
                    target: item_3
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_4
                    border.color: "black"
                }
            },
            State {
                name: "QUADRADO_3"
                PropertyChanges {
                    target: edit
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_1
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_2
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_3
                    border.color: "red"
                }
                PropertyChanges {
                    target: item_4
                    border.color: "black"
                }
            },
            State {
                name: "QUADRADO_4"
                PropertyChanges {
                    target: edit
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_1
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_2
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_3
                    border.color: "black"
                }
                PropertyChanges {
                    target: item_4
                    border.color: "red"
                }
            }
        ]
        //Transição entre as telas
        transitions: [
            Transition {
                to: "EDIT"
                PropertyAnimation { duration: 0 }
            },
            Transition {
                to: "QUADRADO_1"
                PropertyAnimation { duration: 0 }
            },
            Transition {
                to: "QUADRADO_2"
                PropertyAnimation { duration: 0 }
            },
            Transition {
                to: "QUADRADO_3"
                PropertyAnimation { duration: 0 }
            },
            Transition {
                to: "QUADRADO_4"
                PropertyAnimation { duration: 0 }
            }
        ]

        //Ações para os botões de ajustes do sistema para o cuidador

        Keys.onPressed: {
            //Navegação entre o modo de varedura automática e varredura com um timer para seleção
            if (event.key === Qt.Key_1) {
                tela_inicial.modo_selecao = 1
                modo_selecao.text = "Modo de seleção: varredura"
                timer.start()
                timer2.stop()
            }
            else if(event.key === Qt.Key_2) {
                tela_inicial.modo_selecao = 2
                modo_selecao.text = "Modo de seleção: contagem regressiva"
                timer2.start()
                timer.stop()
            }
            //Aumentar ou diminuir o tempo de varredura
            else if(event.key === Qt.Key_Left) {
                if(tela_inicial.modo_selecao == 1) {
                    timer.interval = timer.interval - 500
                } else {
                    timer2.interval = timer2.interval - 500
                    timer2.restart()
                }
            }

            else if(event.key === Qt.Key_Right) {
                if(tela_inicial.modo_selecao == 1) {
                    timer.interval = timer.interval + 500
                } else {
                    timer2.interval = timer2.interval + 500
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
        }
    }

}
