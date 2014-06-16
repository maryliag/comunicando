import QtQuick 2.2

// Rosa: comprimentos e expressões sociais
// Amarelo: sujeitos
// Verde: verbos
// Laranja: substantivos
// Azul: adjetivos
// Branco: demais

//Lista de elementos possiveis para ações/falas dos usuários
ListModel {
    //Lista de Necessidades
    ListElement {
        name: "Necessidade"
        cor: "orange"
        type: "menu"
        image: "resources/necessidade.png"
        subItems: [
            ListElement {
                name: "Bebida"
                cor: "orange"
                type: "submenu"
                image: "resources/bebida.png"
                subItems: []
            },

            ListElement {
                name: "Comida"
                cor: "orange"
                type: "submenu"
                image: "resources/comida.png"
                subItems: []
            },

            ListElement {
                name: "Banheiro"
                cor: "orange"
                type: "submenu"
                image: "resources/banheiro.png"
                subItems:[]
            },
            ListElement {
                name: ""
                cor: "white"
                type: "submenu"
                image: ""
                subItems: []
            }
        ]
    }
    //Lista de pessoas
    ListElement {
        name: "Pessoa"
        cor: "yellow"
        type: "menu"
        image: "resources/pessoa.png"
        subItems: [
            ListElement {
                name: "Mãe"
                cor: "yellow"
                type: "submenu"
                image: "resources/mae.png"
                subItems: []
            },
            ListElement {
                name: "Pai"
                cor: "yellow"
                type: "submenu"
                image: "resources/pai.png"
                subItems: []
            },
            ListElement {
                name: "Cuidadora"
                cor: "yellow"
                type: "submenu"
                image: "resources/cuidadora.png"
                subItems: []
            },
            ListElement {
                name: ""
                cor: "white"
                type: "submenu"
                image: ""
                subItems: []
            }
        ]
    }

    //Realizar alguma atividade
    ListElement {
        name: "Atividade"
        cor: "green"
        type: "menu"
        image: "resources/atividade.png"
        subItems: [
            ListElement {
                name: "Assistir TV"
                cor: "green"
                type: "submenu"
                image: "resources/tv.png"
                subItems: []
            },
            ListElement {
                name: "Escutar uma História"
                cor: "green"
                type: "submenu"
                image: "resources/historia.png"
                subItems: []
            },
            ListElement {
                name: "Jogar"
                cor: "green"
                type: "submenu"
                image: "resources/jogar.png"
                subItems: []
            },
            ListElement {
                name: ""
                cor: "white"
                type: "submenu"
                image: ""
                subItems: []
            }
        ]
    }

    //Lista de como o usuário está se sentindo
    ListElement {
        name: "Sentimento"
        cor: "blue"
        type: "menu"
        image: "resources/sentimento.png"
        subItems: []
    }
}
