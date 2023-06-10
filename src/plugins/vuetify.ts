import "@mdi/font/css/materialdesignicons.css";
import "vuetify/styles";
import { createVuetify } from "vuetify";

export default createVuetify({
    theme: {
        defaultTheme: "my_theme",
        themes: {
            my_theme: {
                colors: {
                    primary: "#F44336",
                },
            },
        },
    },
});
