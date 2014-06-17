import QtQuick 2.2

// Rosa: comprimentos e expressões sociais
// Amarelo: sujeitos
// Verde: verbos
// Laranja: substantivos
// Azul: adjetivos
// Branco: demais

//Lista de elementos possiveis para ações/falas dos usuários
ListModel {
    ListElement {
        name: "Casa"
        cor: "white"
        type: "menu"
        image: "resources/new/casa.png"
        subItems: [
            ListElement {
                name: "Meu quarto"
                cor: "white"
                type: "submenu"
                image: "resources/new/quarto_crianca.png"
                subItems: []
            },

            ListElement {
                name: "Quarto pais"
                cor: "white"
                type: "submenu"
                image: "resources/new/quarto_pais.png"
                subItems: []
            },

            ListElement {
                name: "Quintal"
                cor: "white"
                type: "submenu"
                image: "resources/new/quintal.png"
                subItems:[]
            },
            ListElement {
                name: "Cozinha"
                cor: "white"
                type: "submenu"
                image: "resources/new/cozinha.png"
                subItems: []
            }
        ]
    }

    ListElement {
        name: "Escola"
        cor: "white"
        type: "menu"
        image: "resources/new/escola.png"
        subItems: [
            ListElement {
                name: "Sala de aula"
                cor: "white"
                type: "submenu"
                image: "resources/new/sala_aula.png"
                subItems: []
            },

            ListElement {
                name: "Elevador"
                cor: "white"
                type: "submenu"
                image: "resources/new/elevador.png"
                subItems: []
            },

            ListElement {
                name: "Brinquedoteca"
                cor: "white"
                type: "submenu"
                image: "resources/new/brinquedoteca.png"
                subItems:[]
            },
            ListElement {
                name: "Refeitório"
                cor: "white"
                type: "submenu"
                image: "resources/new/refeitorio.png"
                subItems: []
            }
        ]
    }

    ListElement {
        name: "Passear"
        cor: "white"
        type: "menu"
        image: "resources/new/passear.png"
        subItems: [
            ListElement {
                name: "Cinema"
                cor: "white"
                type: "submenu"
                image: "resources/new/cinema.png"
                subItems: []
            },

            ListElement {
                name: "Praia"
                cor: "white"
                type: "submenu"
                image: "resources/new/praia.png"
                subItems: []
            },

            ListElement {
                name: "Parque"
                cor: "white"
                type: "submenu"
                image: "resources/new/parque.png"
                subItems:[]
            },
            ListElement {
                name: "Sorveteria"
                cor: "white"
                type: "submenu"
                image: "resources/new/sorveteria.png"
                subItems: []
            }
        ]
    }

    ListElement {
        name: "Comida"
        cor: "orange"
        type: "menu"
        image: "resources/new/comer.png"
        subItems: [
            ListElement {
                name: "Sorvete"
                cor: "orange"
                type: "submenu"
                image: "resources/new/sorvete.png"
                subItems: []
            },
            ListElement {
                name: "Café"
                cor: "orange"
                type: "submenu"
                image: "resources/new/cafe.png"
                subItems: []
            },
            ListElement {
                name: "Chocolate"
                cor: "orange"
                type: "submenu"
                image: "resources/new/chocolate.png"
                subItems: []
            },
            ListElement {
                name: "Pirulito"
                cor: "orange"
                type: "submenu"
                image: "resources/new/pirulito.png"
                subItems: []
            }
        ]
    }

    ListElement {
        name: "Brinquedo"
        cor: "orange"
        type: "menu"
        image: "resources/new/brinquedos.png"
        subItems: [
            ListElement {
                name: "Angry Birds"
                cor: "orange"
                type: "submenu"
                image: "resources/new/angry_birds.png"
                subItems: []
            },
            ListElement {
                name: "Helicoptero"
                cor: "orange"
                type: "submenu"
                image: "resources/new/helicoptero.png"
                subItems: []
            },
            ListElement {
                name: "Bola"
                cor: "orange"
                type: "submenu"
                image: "resources/new/bola.png"
                subItems: []
            },
            ListElement {
                name: "Tinta"
                cor: "orange"
                type: "submenu"
                image: "resources/new/tinta.png"
                subItems: []
            }
        ]
    }

    ListElement {
        name: "Sentimento"
        cor: "blue"
        type: "menu"
        image: "resources/atividade.png"
        subItems: [
            ListElement {
                name: "Feliz"
                cor: "blue"
                type: "submenu"
                image: "resources/new.feliz.png"
                subItems: []
            },
            ListElement {
                name: "Triste"
                cor: "blue"
                type: "submenu"
                image: "resources/new/triste.png"
                subItems: []
            },
            ListElement {
                name: "Bravo"
                cor: "blue"
                type: "submenu"
                image: "resources/new/bravo.png"
                subItems: []
            },
            ListElement {
                name: "Medo"
                cor: "blue"
                type: "submenu"
                image: "resources/new/medo.png"
                subItems: []
            }
        ]
    }
}
