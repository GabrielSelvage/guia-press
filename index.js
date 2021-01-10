const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const session = require ("express-session");
const connection = require("./database/database");
const CategoriesController = require("./categories/CategoriesController");
const ArticlesController = require("./articles/ArticlesController");
const UserController = require("./user/UserController");
const Article = require("./articles/Article");
const Category = require("./categories/Category");
const User = require("./user/User");

//view engine
app.set('view engine', 'ejs');

//static
app.use(express.static('public'));

//body-parser
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

//sessions
app.use(session({
    secret: "aosifjsijfosjgros", cookie: {maxAge: 30000}
}));

//database
connection
    .authenticate()
    .then(() => {
        console.log("Conexão feita com sucesso!");
    }).catch((error) => {
        console.log(error);
    })

app.use("/", CategoriesController);
app.use("/", ArticlesController);
app.use("/", UserController);

/* app.get("/session", (req, res) => {
    req.session.ano = 2019
    req.session.treinamento = "Formação Node.js"
    req.session.email = "gabriel.selvage@hotmail.com"
    req.session.user = {
        username: "gabriel",
        email: "gabriel.selvage@gmail.com",
        id: 10
    }
    res.send("Sessão gerada!");
});

app.get("/leitura", (req, res) => {
    res.json ({
        treinamento: req.session.treinamento,
        ano: req.session.ano,
        email: req.session.email,
        user: req.session.user
    })
    
}); */

app.get("/", (req, res) => {
    Article.findAll({
        order: [
            ['id', 'DESC']
        ],
        limit: 4
    }).then(articles => {
        Category.findAll().then(categories => {
            res.render("index", {articles: articles, categories: categories});
        });
    });
});

app.get("/:slug", (req, res) => {
    var slug = req.params.slug;
    Article.findOne({
        where: {
            slug: slug
        }
    }).then(article => {
        if (article != undefined) {
            Category.findAll().then(categories => {
                res.render("article", {article: article, categories: categories})
            });
        } else {
            res.redirect("/");
        }
    }).catch(err => {
        res.redirect("/");
    })
})

app.get("/category/:slug", (req, res) => {
    var slug = req.params.slug;
    Category.findOne({
        where: {
            slug: slug
        },
        include: [{model: Article}]
    }).then(category => {
        if (category != undefined) {
            Category.findAll().then(categories => {
                res.render("index", {articles: category.articles, categories: categories});
            });
        } else {
            res.redirect("/");
        }
    }).catch(err => {
            res.redirect("/");
    })
})


app.listen(3000, () => {
    console.log("O servidor está rodando!");
})

