/** @type {import('tailwindcss').Config} */
module.exports = {
    content: ["../templates/**/*.pug"],
    theme: {
        extend: {},
    },
    plugins: [
        require('daisyui'),
    ],
    daisyui: {
        themes: ["light", "dark", "cupcake"],
    },
}

