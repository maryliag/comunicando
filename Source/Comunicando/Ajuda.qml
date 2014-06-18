import QtQuick 2.0
import QtQuick.Controls 1.1

ApplicationWindow {
    property int windowWidth: 420
    property int windowHeight: 500

    height: windowHeight
    maximumHeight: windowHeight
    minimumHeight: windowHeight
    width: windowWidth
    maximumWidth: windowWidth
    minimumWidth: windowWidth
    color: "white"

    ScrollView {
        height: parent.height
        width: parent.width
        flickableItem.anchors.margins: 10

        Text{
            id:textoAjuda
            width: parent.width
            wrapMode: "WordWrap"
            text:"
<h1>Bem-vindo ao Comunicando</h1>

<h2>Alterando as configurações</h2>
<p>
    Você pode alterar as configurações do programa dependendo da sua necessidade apertando as teclas de atalho
    para cada opção.
</p>

<h3>Modo de Seleção</h3>
<p>
    Para alterar o <b>Modo de Seleção</b> aperte a tecla <b>[ 1 ]</b> para o modo <b>Varredura</b> ou aperte a tecla
    <b>[ 2 ]</b> para o modo de <b>Contagem Regressiva</b>.
</p>

<h3>Tempo de Escolha</h3>
<p>
    Você pode alterar o <b>Tempo de Escolha</b> para uma opção usando as teclas de seta para a <b>esquerda [ ← ]</b>
    para <b>diminuir o tempo</b> e para a <b>direita [ → ]</b> para <b>aumentar</b> o tempo de seleção.
</p>

<h3>Barra de Status</h3>

<p>
    Você pode conferir as configurações atuais do programa na <b>Barra de Status</b> que fica localizada na parte de baixo
    da janela.
</p>
"
        }
    }
}
