import express from "express";

const app = express();

app.get('/', (req, res) =>
{
    res.send("Bienvenidos a mi programa");
})

app.use((req, res, next) => {
    res.status(404).send('<img src="https://http.cat/404.jpg" alt="404 Not Found" />');
});


export default app;