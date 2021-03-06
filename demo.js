import Iqons from './src/js/iqons.js';

window.Iqons = Iqons;


function renderIdenticons(text) {
    document.querySelectorAll('.iqons:not(.small)').forEach((e, i) => Iqons.render(text + (i === 0 ? '' : i), e));

    // for testing render the small iqons as image
    document.querySelectorAll('.iqons.small').forEach((e, i) => Iqons.image(text + i)
        .then($img => {
            e.textContent = ''; // clear old content
            e.appendChild($img);
        }));
}

renderIdenticons('' + Date.now());

document.querySelector('#text-input').addEventListener('input', event => renderIdenticons(event.target.value));