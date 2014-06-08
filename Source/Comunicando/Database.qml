import QtQuick 2.0
import QtQuick.LocalStorage 2.0 as Sql

Item {
    //
    // Gerenciar Categorias
    //
    function obterCategoria(id) {
        return executarQuery("SELECT * FROM categoria WHERE id=?", [id]).rows[0];
    }

    function criarCategoria(nome, cor, imagem) {
        executarQuery("INSERT INTO categoria ('nome', 'cor', 'imagem') VALUES(?, ?, ?)", [nome, cor, imagem]);
    }

    function atualizarCategoria(id, nome, cor, imagem) {
        executarQuery("UPDATE categoria SET nome=?, cor=?, imagem=? WHERE id=?", [nome, cor, imagem, id]);
    }

    function removerCategoria(id) {
        executarQuery("DELETE FROM categoria WHERE id=?", [id]);
        executarQuery("DELETE FROM acao WHERE categoriaId=?", [id]);
    }

    //
    // Gerenciar Acoes
    //
    function obterAcao(id) {
        return executarQuery("SELECT * FROM acao WHERE id=?", [id]).rows[0];
    }

    function criarAcao(idCategoria, nome, cor, imagem) {
        executarQuery(
            "INSERT INTO acao ('categoriaId', 'nome', 'cor', 'imagem') VALUES(?, ?, ?, ?)",
            [idCategoria, nome, cor, imagem]);
    }

    function atualizarAcao(id, idCategoria, nome, cor, imagem) {
        executarQuery(
            "UPDATE categoria SET categoriaId=?, nome=?, cor=?, imagem=? WHERE id=?",
            [idCategoria, nome, cor, imagem, id]);
    }

    function removerAcao(id) {
        executarQuery("DELETE FROM acao WHERE id=?", [id]);
    }

    //
    // Popular estruturas de dados
    //
    function popularListModel(model) {
        var db = getDatabase();
        db.transaction(function(tx) {
            var categorias = tx.executeSql("SELECT * FROM categoria");

            for (var i = 0; i < categorias.rows.length;  i++) {
                var categoria = categorias.rows.item(i);
                var acoes = tx.executeSql("SELECT * FROM acao WHERE categoriaId=?", [categoria.id]);

                var subItems = [{
                    "name" : "Voltar",
                    "cor"  : "white",
                    "type" : "submenu",
                    "image": "resources/voltar.png"
                }];

                for (var j = 0; j < acoes.rows.length; j++) {
                    var acao = acoes.rows.item(j);
                    subItems.push({
                        "name": acao.nome,
                        "cor": categoria.cor,
                        "type" : "submenu",
                        "image": acao.imagem
                    });
                }

                model.append({
                    "name": categoria.nome,
                    "cor": categoria.cor,
                    "type": "menu",
                    "image": categoria.imagem,
                    "subItems": subItems
                });
            }
        });
    }

    function popularNomesCategorias(model) {
        var db = getDatabase();
        db.transaction(function(tx) {
            var categorias = tx.executeSql("SELECT id, nome FROM categoria");
            for (var i = 0; i < categorias.rows.length; i++) {
                var categoria = categorias.rows.item(i);
                model.append({ "text": categoria.nome, "id": categoria.id });
            }
        });
    }

    function popularNomesAcoes(model, categoriaId) {
        var db = getDatabase();
        db.transaction(function(tx) {
            var acoes = tx.executeSql("SELECT id, nome FROM acao WHERE categoriaId=?", [categoriaId]);
            for (var i = 0; i < acoes.rows.length; i++) {
                var acao = acoes.rows.item(i);
                model.append({ "text": acao.nome, "id": acao.id });
            }
        });
    }

    //
    // Funcoes auxiliares
    //
    function getDatabase() {
        return Sql.LocalStorage.openDatabaseSync(
                    "ComunicandoDB", "1.0", "Base de dados para o aplicativo Comunicando", 100000);
    }

    function executarQuery(query, valores) {
        var result;
        var db = getDatabase();
        db.transaction(function(tx){
            result = tx.executeSql(query, valores);
        });

        return result;
    }

    function seedDatabase() {
        var db = getDatabase();

        //create table
        db.transaction(function(tx) {
            tx.executeSql([
                "CREATE TABLE IF NOT EXISTS categoria(",
                    "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,",
                    "nome TEXT,",
                    "cor TEXT,",
                    "imagem TEXT",
                ");"
            ].join(''));

            tx.executeSql([
                "CREATE TABLE IF NOT EXISTS acao(",
                    "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,",
                    "categoriaId INTEGER,",
                    "nome TEXT,",
                    "imagem TEXT,",
                    "FOREIGN KEY(categoriaId) REFERENCES categoria(id)",
                ");"
            ].join(''));

            var tabelaCategorias = tx.executeSql("SELECT * FROM categoria");
            if (tabelaCategorias.rows.length === 0) {

                // Rosa: comprimentos e expressões sociais
                // Amarelo: sujeitos
                // Verde: verbos
                // Laranja: substantivos
                // Azul: adjetivos
                // Branco: demais

                var queryInserirCategoria = "INSERT INTO categoria('id', 'nome', 'cor', 'imagem') VALUES(?, ?, ?, ?)";
                tx.executeSql(queryInserirCategoria, [1, "Necessidade", "orange", "resources/necessidade.png"]);
                tx.executeSql(queryInserirCategoria, [2, "Dor"        , "pink"  , "resources/dor.png"]);
                tx.executeSql(queryInserirCategoria, [3, "Pessoa"     , "yellow", "resources/pessoa.png"]);
                tx.executeSql(queryInserirCategoria, [4, "Atividade"  , "green" , "resources/atividade.png"]);

                var queryInserirAcao = "INSERT INTO acao('id', 'categoriaId', 'nome', 'imagem') VALUES(?, ?, ?, ?)";
                tx.executeSql(queryInserirAcao, [1, 1, "Bebida"  , "resources/bebida.png"]);
                tx.executeSql(queryInserirAcao, [2, 1, "Comida"  , "resources/comida.png"]);
                tx.executeSql(queryInserirAcao, [3, 1, "Banheiro", "resources/banheiro.png"]);

                tx.executeSql(queryInserirAcao, [4, 2, "Cabeça", "resources/cabeca.png"]);
                tx.executeSql(queryInserirAcao, [5, 2, "Braço" , "resources/braco.png"]);
                tx.executeSql(queryInserirAcao, [6, 2, "Perna" , "resources/perna.png"]);
                tx.executeSql(queryInserirAcao, [7, 2, "Costas", "resources/costas.png"]);

                tx.executeSql(queryInserirAcao, [8 , 3, "Mãe"      , "resources/mae.png"]);
                tx.executeSql(queryInserirAcao, [9 , 3, "Pai"      , "resources/pai.png"]);
                tx.executeSql(queryInserirAcao, [10, 3, "Cuidadora", "resources/cuidadora.png"]);

                tx.executeSql(queryInserirAcao, [11, 4, "Assistir TV"         , "resources/tv.png"]);
                tx.executeSql(queryInserirAcao, [12, 4, "Escutar uma História", "resources/historia.png"]);
                tx.executeSql(queryInserirAcao, [13, 4, "Jogar"               , "resources/jogar.png"]);

                tx.executeSql(queryInserirAcao, [14, 5, "Feliz"  , "resources/feliz.png"]);
                tx.executeSql(queryInserirAcao, [15, 5, "Triste" , "resources/triste.png"]);
                tx.executeSql(queryInserirAcao, [16, 5, "Saudade", "resources/saudade.png"]);
                tx.executeSql(queryInserirAcao, [17, 5, "Tédio"  , "resources/tedio.png"]);

                tx.executeSql(queryInserirAcao, [18, 6, "Mãe"      , "resources/mae.png"]);
                tx.executeSql(queryInserirAcao, [19, 6, "Pai"      , "resources/pai.png"]);
                tx.executeSql(queryInserirAcao, [20, 6, "Cuidadora", "resources/cuidadora.png"]);
            }
        });
    }
}
