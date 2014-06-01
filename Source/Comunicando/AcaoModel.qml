import QtQuick 2.2

// Rosa: comprimentos e expressões sociais
// Amarelo: sujeitos
// Verde: verbos
// Laranja: substantivos
// Azul: adjetivos
// Branco: demais

ListModel {
    ListElement {
        name: "Necessidade"
        cor: "orange"
        type: "menu"
        image: "resources/smiley.jpg"
        subItems: [
            ListElement {
                name: "Voltar"
                cor: "white"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Bebida"
                cor: "orange"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Comida"
                cor: "orange"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Banheiro"
                cor: "orange"
                type: "submenu"
                image: "resources/smiley.jpg"
            }
        ]
    }
    ListElement {
        name: "Dor"
        cor: "pink"
        type: "menu"
        image: "resources/smiley.jpg"
        subItems: [
            ListElement {
                name: "Voltar"
                cor: "white"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Cabeça"
                cor: "pink"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Braço"
                cor: "pink"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Perna"
                cor: "pink"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Costas"
                cor: "pink"
                type: "submenu"
                image: "resources/smiley.jpg"
            }
        ]
    }
    ListElement {
        name: "Pessoa"
        cor: "yellow"
        type: "menu"
        image: "resources/smiley.jpg"
        subItems: [
            ListElement {
                name: "Voltar"
                cor: "white"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Mãe"
                cor: "yellow"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Pai"
                cor: "yellow"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Cuidadora"
                cor: "yellow"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Enfermeira"
                cor: "yellow"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Irmãos"
                cor: "yellow"
                type: "submenu"
                image: "resources/smiley.jpg"
            }
        ]
    }
    ListElement {
        name: "Atividade"
        cor: "green"
        type: "menu"
        image: "resources/smiley.jpg"
        subItems: [
            ListElement {
                name: "Voltar"
                cor: "white"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Assistir TV"
                cor: "green"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Escutar uma História"
                cor: "green"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Jogar"
                cor: "green"
                type: "submenu"
                image: "resources/smiley.jpg"
            }
        ]
    }
    ListElement {
        name: "Sentimento"
        cor: "blue"
        type: "menu"
        image: "resources/smiley.jpg"
        subItems: [
            ListElement {
                name: "Voltar"
                cor: "white"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Feliz"
                cor: "blue"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Triste"
                cor: "blue"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Saudade"
                cor: "blue"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Tédio"
                cor: "blue"
                type: "submenu"
                image: "resources/smiley.jpg"
            }
        ]
    }
    ListElement {
        name: "Maus Tratos"
        cor: "dark red"
        type: "menu"
        image: "resources/smiley.jpg"
        subItems: [
            ListElement {
                name: "Voltar"
                cor: "white"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Mãe"
                cor: "dark red"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Pai"
                cor: "dark red"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Cuidadora"
                cor: "dark red"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Enfermeira"
                cor: "dark red"
                type: "submenu"
                image: "resources/smiley.jpg"
            },
            ListElement {
                name: "Irmãos"
                cor: "dark red"
                type: "submenu"
                image: "resources/smiley.jpg"
            }
        ]
    }
}
