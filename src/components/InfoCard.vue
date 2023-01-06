<script setup lang="ts">

const birthday = new Date("2005-02-14");

const info:Map<string, any> = new Map<string, any>([
    // https://stackoverflow.com/a/50827764
    ["Age", Math.floor((Date.now() - birthday.getTime()) / 3.15576e+10)],
    ["Country", "United States"],
    ["State", "Nevada"],
    ["Email", "erikastaroza@gmail.com"]
]);

</script>

<template>
    <v-card class="card" elevation="3">
        <div class="info">
            <div v-for="i in info" style="display: flex; flex-direction: row; align-items: center;">
                <p><strong>{{ i[0] }}</strong></p>
                <div style="width: 10px;"></div>
                <p>{{ i[1] }}</p>
            </div>
        </div>
        <div class="bio">
            <p><strong>Hello! I'm Erikas Taroza</strong></p>
            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque.
Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores.</p>
        
            <div style="margin-top: 20px;">
                <v-btn
                    color="primary"
                    variant="flat"
                    style="margin-right: 20px;"
                >
                    Download CV
                </v-btn>

                <v-btn color="#EEEEEE" variant="flat">
                    Contact Me
                </v-btn>
            </div>
        </div>
    </v-card>
</template>

<style scoped>
    @media(min-width: 800px) {
        .card {
            max-width: 1100px;
            width: 100%;
            display: grid;
            grid-template-columns: 1.2fr 2fr;
        }
    }

    .card {
        padding: 20px;
    }

    .info {
        margin-bottom: 10px;
    }

    .bio p {
        font-size: 16px;
        margin-bottom: 10px;
    }

</style>