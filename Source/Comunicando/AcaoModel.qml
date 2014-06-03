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
                name: "Voltar"
                cor: "white"
                type: "submenu"
                image: "resources/voltar.png"
            },

            ListElement {
                name: "Bebida"
                cor: "orange"
                type: "submenu"
                image: "resources/bebida.png"
            },

            ListElement {
                name: "Comida"
                cor: "orange"
                type: "submenu"
                image: "resources/comida.png"
            },

            ListElement {
                name: "Banheiro"
                cor: "orange"
                type: "submenu"
                image: "resources/banheiro.png"
            }
        ]
    }
//Lista de elementos para expressar dores
    ListElement {
        name: "Dor"
        cor: "pink"
        type: "menu"
        image: "resources/dor.png"
        subItems: [
            ListElement {
                name: "Voltar"
                cor: "white"
                type: "submenu"
                image: "resources/voltar.png"
            },
            ListElement {
                name: "Cabeça"
                cor: "pink"
                type: "submenu"
                image: "resources/cabeca.png"
            },
            ListElement {
                name: "Braço"
                cor: "pink"
                type: "submenu"
                image: "resources/braco.png"
            },
            ListElement {
                name: "Perna"
                cor: "pink"
                type: "submenu"
                image: "resources/perna.png"
            },
            ListElement {
                name: "Costas"
                cor: "pink"
                type: "submenu"
                image: "resources/costas.png"
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
                name: "Voltar"
                cor: "white"
                type: "submenu"
                image: "resources/voltar.png"
            },
            ListElement {
                name: "Mãe"
                cor: "yellow"
                type: "submenu"
                image: "resources/mae.png"
            },
            ListElement {
                name: "Pai"
                cor: "yellow"
                type: "submenu"
                image: "resources/pai.png"
            },
            ListElement {
                name: "Cuidadora"
                cor: "yellow"
                type: "submenu"
                image: "resources/cuidadora.png"
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
                name: "Voltar"
                cor: "white"
                type: "submenu"
                image: "resources/voltar.png"
            },
            ListElement {
                name: "Assistir TV"
                cor: "green"
                type: "submenu"
                image: "resources/tv.png"
            },
            ListElement {
                name: "Escutar uma História"
                cor: "green"
                type: "submenu"
                image: "resources/historia.png"
            },
            ListElement {
                name: "Jogar"
                cor: "green"
                type: "submenu"
                image: "resources/jogar.png"
            }
        ]
    }

    //Lista de como o usuário está se sentindo
    ListElement {
        name: "Sentimento"
        cor: "blue"
        type: "menu"
        image: "resources/sentimento.png"
        subItems: [
            ListElement {
                name: "Voltar"
                cor: "white"
                type: "submenu"
                image: "resources/voltar.png"
            },
            ListElement {
                name: "Feliz"
                cor: "blue"
                type: "submenu"
                image: "resources/feliz.png"
            },
            ListElement {
                name: "Triste"
                cor: "blue"
                type: "submenu"
                image: "resources/triste.png"
            },
            ListElement {
                name: "Saudade"
                cor: "blue"
                type: "submenu"
                image: "resources/saudade.png"
            },
            ListElement {
                name: "Tédio"
                cor: "blue"
                type: "submenu"
                image: "resources/tedio.png"
            }
        ]
    }
    //Lista de maus tratos
    ListElement {
        name: "Maus Tratos"
        cor: "dark red"
        type: "menu"
        image: "resources/maus_tratos.png"
        subItems: [
            ListElement {
                name: "Voltar"
                cor: "white"
                type: "submenu"
                image: "resources/voltar.png"
            },
            ListElement {
                name: "Mãe"
                cor: "dark red"
                type: "submenu"
                image: "resources/mae.png"
            },
            ListElement {
                name: "Pai"
                cor: "dark red"
                type: "submenu"
                image: "resources/pai.png"
            },
            ListElement {
                name: "Cuidadora"
                cor: "dark red"
                type: "submenu"
                image: "resources/cuidadora.png"
            }
        ]
    }
}
