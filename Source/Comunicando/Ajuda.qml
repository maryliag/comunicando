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

<h4>1. Tempo de Escolha</h4>
<p>
    Você pode alterar o <b>Tempo de Escolha</b> para uma opção usando as teclas de seta para a <b>esquerda [ ← ]</b>
    para <b>diminuir o tempo</b> e para a <b>direita [ → ]</b> para <b>aumentar</b> o tempo de seleção.
</p>

<h4>2. Orientação das Imagens</h4>
<p>
    A <b>Orientação das Imagens</b> pode ser trocada usando as teclas <b>[ H ]</b> para que as imagens se movam no sentido
    <b>Horizontal</b> ou <b>[ V ]</b> para que elas percorram o sentido <b>Vertical</b>.
</p>

<h4>3. Tamanho das Imagens</h4>
<p>
    O <b>Tamanho das Imagens</b> pode ser configurado usando as teclas <b>[ G ]</b> para aumenta-las ou <b>[ P ]</b> para
    diminuí-las.
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
