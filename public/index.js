function render(data) {
    const output = document.getElementById('output')
    output.innerHTML = `<div>
                    ${data}
               </div>`

}

function getBooksByLang(lang) {
    fetch(`./lang:${lang}`)
        .then(response => response.json())
        .then(render)
        .catch(err => render(err))
}

window.onload = () => {
    document
        .getElementById('selectLang')
        .addEventListener('change', (e) => {
            getBooksByLang(e.target[e.target.selectedIndex].value)
        })
}
