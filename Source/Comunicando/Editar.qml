import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Dialogs 1.1

Rectangle {
    anchors.fill: parent

    ListModel { id: categorias }
    ListModel { id: acoes }

    Row {
        spacing: 30
        Column {
            ComboBox {
                id: listaCategorias
                width: 200
                model: categorias
                onCurrentIndexChanged: {
                    acoes.clear();
                    var idCategoriaAtual = categorias.get(currentIndex).id
                    database.popularNomesAcoes(acoes, idCategoriaAtual);

                    var categoria = database.obterCategoria(idCategoriaAtual);
                    categoriaNome.text = categoria.nome;

                    listaAcoes.model = [];
                    listaAcoes.model = acoes;
                }
            }

            ComboBox {
                id: listaAcoes
                width: 200
            }

            Button {
                text: "Voltar"
                onClicked: {
                    loader.source = "Comunicando.qml"
                }
            }
        }

        Column {
            width: 200
            Text { text: "Categoria" }

            Row {
                spacing: 10
                Text { text: "Nome:" }
                TextField { id: categoriaNome }
            }

            Row {
                spacing: 10
                Text { text: "Cor:" }
                TextField { id: categoriaCor }
            }

            Row {
                spacing: 10
                Text { text: "Imagem:" }
                Button {
                    text: "Arquivo..."
                    onClicked: { categoriaFileDialog.open(); }
                }
            }

            Text {
                text: {
                    var partes = categoriaFileDialog.fileUrl.toString().split('/');
                    return partes[partes.length-1];
                }
            }

            Button {
                text: "Adicionar nova Categoria"
                onClicked: {
                    var nome = categoriaNome.text;
                    var cor = categoriaCor.text;
                    var imagem = categoriaFileDialog.fileUrl.toString();
                    database.criarCategoria(nome, cor, imagem)
                }
            }

            FileDialog {
                id: categoriaFileDialog
                title: "Selecionar imagem"
                selectedNameFilter: "Imagens (*.png *.jpg)"
                folder: "."
            }
        }

        Column {
            width: 200
            Text { text: "Ação" }

            Row {
                spacing: 10
                Text { text: "Nome:" }
                TextField { }
            }

            Row {
                spacing: 10
                Text { text: "Cor:" }
                TextField { }
            }

            Row {
                spacing: 10
                Text { text: "Imagem:" }
                Button { text: "Arquivo..." }
            }
        }
    }

    Component.onCompleted: {
        database.popularNomesCategorias(categorias);
    }
}
