const tipoRadios = document.querySelectorAll('input[name="tipo"]');
const descricaoCategoria = document.getElementById('descricaoCategoria');
const descricaoInput = document.querySelector('input[name="descricao"]');
const categoriaSelect = document.querySelector('select[name="categoria"]');

tipoRadios.forEach(function (radio) {
    radio.addEventListener('change', function () {
        if (radio.value === 'receita') {
            descricaoCategoria.style.display = 'block';
            descricaoInput.style.display = 'block';
            categoriaSelect.style.display = 'none';
        } else if (radio.value === 'despesa') {
            descricaoCategoria.style.display = 'block';
            descricaoInput.style.display = 'none';
            categoriaSelect.style.display = 'block';
        } else {
            descricaoCategoria.style.display = 'none';
            descricaoInput.style.display = 'none';
            categoriaSelect.style.display = 'none';
        }
    });
});