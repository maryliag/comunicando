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
        name: "Pessoas"
        cor: "yellow"
        type: "menu"
        image: "resources/new/pessoas.png"
        sound: ""
        subItems: [
            ListElement {
                name: "Eu"
                cor: "yellow"
                type: "submenu"
                image: "resources/old/pessoa.png"
                sound: "sounds/eu.wav"
                subItems: []
            },
            ListElement {
                name: "Pai"
                cor: "yellow"
                type: "submenu"
                image: "resources/old/pai.png"
                sound: "sounds/pai.wav"
                subItems: []
            },
            ListElement {
                name: "Mãe"
                cor: "yellow"
                type: "submenu"
                image: "resources/old/mae.png"
                sound: "sounds/mae.wav"
                subItems: []
            },
            ListElement {
                name: "Cuidadora"
                cor: "yellow"
                type: "submenu"
                image: "resources/old/cuidadora.png"
                sound: "sounds/cuidadora.wav"
                subItems: []
            }
        ]
    }
    ListElement {
        name: "Atividades"
        cor: "green"
        type: "menu"
        image: "resources/old/atividade.png"
        sound: ""
        subItems: [
            ListElement {
                name: "Computador"
                cor: "green"
                type: "submenu"
                image: "resources/old/jogar.png"
                sound: "sounds/computador.wav"
                subItems: []
            },
            ListElement {
                name: "TV"
                cor: "green"
                type: "submenu"
                image: "resources/old/tv.png"
                sound: "sounds/tv.wav"
                subItems: []
            },
            ListElement {
                name: "Música"
                cor: "green"
                type: "submenu"
                image: "resources/new/musica.png"
                sound: "sounds/musica.wav"
                subItems: []
            },
            ListElement {
                name: "Passear"
                cor: "green"
                type: "submenu"
                image: "resources/new/passear.png"
                sound: "sounds/passear.wav"
                subItems: []
            }]
    }
    ListElement {
        name: "Lugares"
        cor: "orange"
        type: "menu"
        image: "resources/old/atividade.png"
        sound: ""
        subItems: [
            ListElement {
                name: "Casa"
                cor: "orange"
                type: "submenu"
                image: "resources/new/casa.png"
                sound: ""
                subItems: [
                    ListElement {
                        name: "Meu quarto"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/quarto_crianca.png"
                        sound: "sounds/meuQuarto.wav"
                        subItems: []
                    },

                    ListElement {
                        name: "Quarto pais"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/quarto_pais.png"
                        sound: "sounds/quartoPais.wav"
                        subItems: []
                    },

                    ListElement {
                        name: "Quintal"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/quintal.png"
                        sound: "sounds/quintal.wav"
                        subItems:[]
                    },
                    ListElement {
                        name: "Cozinha"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/cozinha.png"
                        sound: "sounds/cozinha.wav"
                        subItems: []
                    }
                ]
            },
            ListElement {
                name: "Escola"
                cor: "orange"
                type: "submenu"
                image: "resources/new/escola.png"
                sound: ""
                subItems: [
                    ListElement {
                        name: "Sala de aula"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/sala_aula.png"
                        sound: "sounds/salaAula.wav"
                        subItems: []
                    },

                    ListElement {
                        name: "Elevador"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/elevador.png"
                        sound: "sounds/elevador.wav"
                        subItems: []
                    },

                    ListElement {
                        name: "Brinquedoteca"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/brinquedoteca.png"
                        sound: "sounds/brinquedoteca.wav"
                        subItems:[]
                    },
                    ListElement {
                        name: "Refeitório"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/refeitorio.png"
                        sound: "sounds/refeitorio.wav"
                        subItems: []
                    }
                ]
            },
            ListElement {
                name: "Cinema"
                cor: "orange"
                type: "submenu"
                image: "resources/new/cinema.png"
                sound: "sounds/cinema.wav"
                subItems: []
            },
            ListElement {
                name: "Parque"
                cor: "orange"
                type: "submenu"
                image: "resources/new/parque.png"
                sound: "sounds/parque.wav"
                subItems:[]
            }]
    }
    ListElement {
        name: "Outros"
        cor: "white"
        type: "menu"
        image: "resources/new/outros.png"
        sound: ""
        subItems: [
            ListElement {
                name: "Comida"
                cor: "orange"
                type: "menu"
                image: "resources/new/comer.png"
                sound: ""
                subItems: [
                    ListElement {
                        name: "Sorvete"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/sorvete.png"
                        sound: "sounds/sorvete.wav"
                        subItems: []
                    },
                    ListElement {
                        name: "Café"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/cafe.png"
                        sound: "sounds/cafe.wav"
                        subItems: []
                    },
                    ListElement {
                        name: "Chocolate"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/chocolate.png"
                        sound: "sounds/chocolate.wav"
                        subItems: []
                    },
                    ListElement {
                        name: "Pirulito"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/pirulito.png"
                        sound: "sounds/pirulito.wav"
                        subItems: []
                    }
                ]
            },
            ListElement {
                name: "Brinquedo"
                cor: "orange"
                type: "menu"
                image: "resources/new/brinquedos.png"
                sound: ""
                subItems: [
                    ListElement {
                        name: "Angry Birds"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/angry_birds.png"
                        sound: "sounds/angryBirds.wav"
                        subItems: []
                    },
                    ListElement {
                        name: "Helicoptero"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/helicoptero.png"
                        sound: "sounds/helicoptero.wav"
                        subItems: []
                    },
                    ListElement {
                        name: "Bola"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/bola.png"
                        sound: "sounds/bola.wav"
                        subItems: []
                    },
                    ListElement {
                        name: "Tinta"
                        cor: "orange"
                        type: "submenu"
                        image: "resources/new/tinta.png"
                        sound: "sounds/tinta.wav"
                        subItems: []
                    }
                ]
            },
            ListElement {
                name: "Sentimento"
                cor: "blue"
                type: "menu"
                image: "resources/old/sentimento.png"
                sound: ""
                subItems: [
                    ListElement {
                        name: "Feliz"
                        cor: "blue"
                        type: "submenu"
                        image: "resources/new/feliz.png"
                        sound: "sounds/feliz.wav"
                        subItems: []
                    },
                    ListElement {
                        name: "Triste"
                        cor: "blue"
                        type: "submenu"
                        image: "resources/new/triste.png"
                        sound: "sounds/triste.wav"
                        subItems: []
                    },
                    ListElement {
                        name: "Bravo"
                        cor: "blue"
                        type: "submenu"
                        image: "resources/new/bravo.png"
                        sound: "sounds/bravo.wav"
                        subItems: []
                    },
                    ListElement {
                        name: "Medo"
                        cor: "blue"
                        type: "submenu"
                        image: "resources/new/medo.png"
                        sound: "sounds/medo.wav"
                        subItems: []
                    }
                ]
            },
            ListElement {
                name: ""
                cor: "white"
                type: "nada"
                image: ""
                sound: ""
                subItems: []
            }
        ]
    }
}
