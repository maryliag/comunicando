import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: main_window
    title: "Comunicando"
    width: 1200
    height: 900
    menuBar: MenuBar {
        Menu {
            title: "Arquivo"

            MenuItem {
                text: "Editar Itens"
                onTriggered: {
                    loader.source = "Editar.qml"
                }
            }

            MenuItem {
                text: "Sair"
                onTriggered: Qt.quit();
            }
        }

        Menu {
            title: "Ajuda"
            MenuItem {
                text: "Ajuda"
                shortcut: "F1"
                onTriggered: {
                    var component = Qt.createComponent("Ajuda.qml");
                    var win = component.createObject();
                    win.show();
                }
            }
            MenuItem { text: "Sobre" }
        }
    }

    Loader {
        id:loader
        anchors.fill: parent
        focus: true
    }

    Database { id: database }

    Component.onCompleted: {
        loader.source = "Comunicando.qml"
        database.seedDatabase();
    }
}
