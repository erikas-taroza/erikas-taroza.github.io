import express from "express";
import path from "path";

import sendgrid, { MailDataRequired } from "@sendgrid/mail";
sendgrid.setApiKey("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");

const app = express();
const website = path.resolve(`${__dirname}/../../website/dist`);

app.use(express.json());
app.use(express.static(website));

app.get("/", (_, res) => {
    res.sendFile(website + "/index.html");
});

app.post("/send_mail", async (req, res) => {
    const from = req.body["from"];
    const subject = req.body["subject"];
    const message = req.body["message"];

    const mail: MailDataRequired = {
        from,
        subject,
        text: message,
        to: "erikastaroza@gmail.com"
    };

    sendgrid.send(mail)
        .then(() => {
            res.status(200).send("Success.");
        }, error => {
            res.status(500).send(error);
        });
});

app.listen(7777, () => {
    console.log("Started server.");
});