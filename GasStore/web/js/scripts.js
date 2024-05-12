const seeMoreBtn = document.getElementById('see-more-btn');
const descriptionText = document.getElementById('description-text');
const initialHeight = 200; // Chiều cao ban đầu

descriptionText.style.maxHeight = initialHeight + 'px'; // Đặt chiều cao tối đa ban đầu

seeMoreBtn.addEventListener('click', () => {
    const isExpanded = descriptionText.style.maxHeight === 'max-content';
    descriptionText.style.maxHeight = isExpanded ? initialHeight + 'px' : 'max-content';
    seeMoreBtn.textContent = isExpanded ? 'See more' : 'See less';
});
//add to cart button



